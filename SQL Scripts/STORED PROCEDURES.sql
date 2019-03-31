USE AdvancedInc
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_SearchUser')
	DROP PROCEDURE SP_SearchUser
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_getActivosSede')
	DROP PROCEDURE SP_getActivosSede
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_getActivosEmpleado')
	DROP PROCEDURE SP_getActivosEmpleado
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_ActivosEnRango')
	DROP PROCEDURE SP_ActivosEnRango
GO



CREATE PROCEDURE SP_SearchUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50)
AS
	SELECT ROLL 
	FROM USUARIOS 
	WHERE NOMBRE=@UserName
		AND CONTRASENA=@UserPassword;
GO

/*
Monto total de los activos asignados a la sede, en este reporte se muestra la cantidad de
activos asignados, el monto total de los activos según el costo inicial, el monto total de
los activos según el valor residual y el monto total de los activos según el valor en libros
a la fecha de la consulta. La consulta debe mostrar los montos en colones y en dólares,

Falta: precio en libros, columnas con costo en dolares
*/
CREATE PROCEDURE SP_getActivosSede 
	@TipoDeCambio FLOAT
AS
	IF OBJECT_ID('dbo.#TempTable', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable; 
	IF OBJECT_ID('dbo.#TempTable2', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable2; 

	SELECT CodActivo, Nombre, Categoria, PrecioCompra, ValorResidual, VidaUtil/365 AS AñosVidaUtil, DATEDIFF(year, FechaCompra, GETDATE())-1 AS AñosUso, VidaUtil/365*( VidaUtil/365+1)/2 AS Factor, CodSede INTO #TempTable
	FROM ACTIVOS
	WHERE PjeDepreciacion IS NULL AND Estado != 'E'

	SELECT * INTO #TempTable2
	FROM (
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, AñosUso+1 AS AñosUso,
	 		PrecioCompra-(PrecioCompra-ValorResidual)* (1/CONVERT(Float,Factor)*((AñosUso+1)*AñosVidaUtil-(AñosUso*AñosUso+AñosUso)/2.0)) AS ValorEnLibros, CodSede
		FROM #TempTable
		UNION
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, DATEDIFF(year, FechaCompra, GETDATE())-1 AS AñosUso,
	 		PrecioCompra - PrecioCompra*PjeDepreciacion/100*(DATEDIFF(year, FechaCompra, GETDATE())-1) AS ValorEnLibros, CodSede
		FROM ACTIVOS
		WHERE PjeDepreciacion IS NOT NULL AND Estado != 'E'
		) AS Temp2

	SELECT * FROM #TempTable2

	SELECT CodSede, 
		COUNT(CodSede) AS ActivosAsignados,
		SUM(PrecioCompra) AS CostoInicial,
		SUM(ValorEnLibros) AS CostoEnLibros,  
		SUM(ValorResidual) AS CostoResidual, 
		SUM(PrecioCompra)/@TipoDeCambio AS CostoInicialDolares,
		SUM(ValorEnLibros)/@TipoDeCambio AS CostoEnLibrosDolares,
		SUM(ValorResidual)/@TipoDeCambio AS CostoResidualDolares
	FROM #TempTable2
	GROUP BY CodSede
GO

/* 
Monto total de los activos asignados según empleado, en este reporte se muestra la
cantidad de activos asignados, el monto total y promedio de los activos según el costo
inicial, el monto total y promedio de los activos según el valor residual y el monto total y
promedio de los activos según el valor en libros a la fecha de la consulta. La consulta debe
mostrar los montos en colones y en dólares,

Falta: precio en libros, definir ValorResidual, columnas con costo en dolares, filtro por sede de activo
*/

CREATE PROCEDURE SP_getActivosEmpleado 
	@CodigoSede INT, 
	@TipoDeCambio FLOAT
AS
	SELECT E.CodEmpleado, E.Nombre, COUNT(A.CodActivo) AS CantidadAsignados, 
			SUM(A.PrecioCompra) AS CostoInicial,					  AVG(A.PrecioCompra) AS PromedioInicial,
			SUM(A.PrecioCompra)*@TipoDeCambio AS CostoInicialDolares, AVG(A.PrecioCompra)*@TipoDeCambio AS PromedioInicialDolares,
			SUM(A.ValorResidual) AS CostoResidual,					  AVG(A.PrecioCompra) AS PromedioResidual
	FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado
	WHERE A.Estado = 'A' AND A.CodSede = @CodigoSede
	GROUP BY E.CodEmpleado, E.Nombre
GO


/*
Detalle de activos asignados en la sede para un rango de años en particular, para este
rango debe tomar en cuenta la fecha de compra del activo y los años de vida útil

código del activo, nombre del activo, valor inicial del activo, valor residual, categoría,
fecha de compra, años de vida útil, empleado que lo tiene asignado. Este reporte se
puede hacer para todos los activos que cumplan con el rango establecido en los
parámetros o para los activos que cumplan con el rango y que pertenezcan a una
categoría específica.

Maybe make the if/else outside of SP
*/
CREATE PROCEDURE SP_ActivosEnRango 
	@FechaInicio DATE, 
	@FechaFinal DATE, 
	@Categoria VARCHAR(50)
AS
	IF @Categoria IS NULL
		SELECT  CodActivo, Nombre, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AnosVidautil, CodEmpleado
		FROM ACTIVOS
		WHERE Estado = 'A'
	ELSE
		SELECT  CodActivo, Nombre, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AnosVidautil, CodEmpleado
		FROM ACTIVOS
		WHERE Estado = 'A' AND Categoria = @Categoria
	
GO



/*
Monto total de los activos asignados a todas las sedes

cantidad de activos asignados, el monto total de los activos según
el costo inicial, el monto total de los activos según el valor residual y el monto total de los
activos según el valor en libros a la fecha de la consulta. La consulta debe mostrar los montos
en colones y en dólares,
*/



/*
Detalle de activos asignados en todas las sedes para un rango de años en particular, para este
rango debe tomar en cuenta la fecha de compra del activo y los años de vida útil, la
información que se debe mostrar para cada activo que se encuentre en el rango indicado es:
código del activo, nombre del activo, valor inicial del activo, valor residual, categoría, fecha
de compra, años de vida útil, empleado que lo tiene asignado. Este reporte se puede hacer
para todos los activos que cumplan con el rango establecido en los parámetros o para los
activos que cumplan con el rango y que pertenezcan a una categoría específica.
*/


/*

Listado de los 3 empleados que tienen mayor cantidad de activos asignados a la fecha. Se
debe mostrar la información de cada empleado, la cantidad de activos asignados por
empleado y el detalle de los activos asignados.

*/


/*

Listado de los 3 empleados cuya suma del valor en libros de los activos asignados es mayor
Se debe mostrar la información de cada empleado y la de los activos asignados.

*/
