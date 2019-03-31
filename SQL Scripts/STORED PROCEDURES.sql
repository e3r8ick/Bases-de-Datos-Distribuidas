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
a la fecha de la consulta. La consulta debe mostrar los montos en colones y en dólares
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
mostrar los montos en colones y en dólares
*/

CREATE PROCEDURE SP_getActivosEmpleado 
	@CodigoEmpleado INT, 
	@TipoDeCambio FLOAT
AS
	IF OBJECT_ID('dbo.#TempTable', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable; 
	IF OBJECT_ID('dbo.#TempTable2', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable2; 

	SELECT CodEmpleado, CodActivo, Nombre, Categoria, PrecioCompra, ValorResidual, VidaUtil/365 AS AñosVidaUtil, DATEDIFF(year, FechaCompra, GETDATE())-1 AS AñosUso, VidaUtil/365*( VidaUtil/365+1)/2 AS Factor, CodSede INTO #TempTable
	FROM ACTIVOS
	WHERE PjeDepreciacion IS NULL AND Estado != 'E' AND CodEmpleado = @CodigoEmpleado

	SELECT * INTO #TempTable2
	FROM (
		SELECT CodEmpleado, CodActivo, Nombre, PrecioCompra, ValorResidual, AñosUso+1 AS AñosUso,
	 		PrecioCompra-(PrecioCompra-ValorResidual)* (1/CONVERT(Float,Factor)*((AñosUso+1)*AñosVidaUtil-(AñosUso*AñosUso+AñosUso)/2.0)) AS ValorEnLibros, CodSede
		FROM #TempTable
		UNION
		SELECT CodEmpleado, CodActivo, Nombre, PrecioCompra, ValorResidual, DATEDIFF(year, FechaCompra, GETDATE())-1 AS AñosUso,
	 		PrecioCompra - PrecioCompra*PjeDepreciacion/100*(DATEDIFF(year, FechaCompra, GETDATE())-1) AS ValorEnLibros, CodSede
		FROM ACTIVOS
		WHERE PjeDepreciacion IS NOT NULL AND Estado != 'E' AND CodEmpleado = @CodigoEmpleado
		) AS Temp2

	SELECT CodEmpleado, COUNT(CodActivo) AS ActivosAsignados,
		SUM(PrecioCompra) AS CostoInicial,
		SUM(ValorEnLibros) AS CostoEnLibros,  
		SUM(ValorResidual) AS CostoResidual, 
	
		AVG(PrecioCompra) AS PromedioInicial,
		AVG(ValorEnLibros) AS PromedioInicialDolares,
		AVG(ValorResidual) AS PromedioResidual,

		SUM(PrecioCompra)/@TipoDeCambio AS CostoInicialDolares,
		SUM(ValorEnLibros)/@TipoDeCambio AS CostoEnLibrosDolares,
		SUM(ValorResidual)/@TipoDeCambio AS CostoResidualDolares,

		AVG(PrecioCompra)/@TipoDeCambio AS PromedioInicial,
		AVG(ValorEnLibros)/@TipoDeCambio AS PromedioInicialDolares,
		AVG(ValorResidual)/@TipoDeCambio AS PromedioResidual
	FROM #TempTable2
	GROUP BY CodEmpleado
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
