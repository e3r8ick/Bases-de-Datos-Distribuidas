USE AdvancedInc
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spGetActivos')
	DROP PROCEDURE spGetActivos
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spGetActivosEmpleado')
	DROP PROCEDURE spGetActivosEmpleado
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spActivosEnRango')
	DROP PROCEDURE spActivosEnRango
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spGetActivosPorSede')
	DROP PROCEDURE spGetActivosPorSede
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spActivosEnRangoPorSede')
	DROP PROCEDURE spActivosEnRangoPorSede
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spTop3EmpleadoConMasActivos')
	DROP PROCEDURE spTop3EmpleadoConMasActivos
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spTop3EmpleadoConMasValor')
	DROP PROCEDURE spTop3EmpleadoConMasValor
GO


/*
Monto total de los activos asignados a la sede, en este reporte se muestra la cantidad de
activos asignados, el monto total de los activos según el costo inicial, el monto total de
los activos según el valor residual y el monto total de los activos según el valor en libros
a la fecha de la consulta. La consulta debe mostrar los montos en colones y en dólares
*/
CREATE PROCEDURE spGetActivos 
	@TipoDeCambio FLOAT,
	@CodigoSede INT
AS
	IF OBJECT_ID('dbo.#TempTable', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable; 
	IF OBJECT_ID('dbo.#TempTable2', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable2; 

	SELECT CodActivo, Nombre, Categoria, PrecioCompra, ValorResidual, VidaUtil/365 AS AñosVidaUtil, DATEDIFF(year, FechaCompra, GETDATE())-1 AS AñosUso, VidaUtil/365*( VidaUtil/365+1)/2 AS Factor, CodSede 
	INTO #TempTable
	FROM ACTIVOS
	WHERE PjeDepreciacion IS NULL AND Estado != 'E' AND CodSede = @CodigoSede

	SELECT * INTO #TempTable2
	FROM (
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, AñosUso+1 AS AñosUso,
	 		PrecioCompra-(PrecioCompra-ValorResidual)* (1/CONVERT(Float,Factor)*((AñosUso+1)*AñosVidaUtil-(AñosUso*AñosUso+AñosUso)/2.0)) AS ValorEnLibros, CodSede
		FROM #TempTable
		UNION
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, DATEDIFF(year, FechaCompra, GETDATE()) AS AñosUso,
	 		PrecioCompra - ((PrecioCompra-ValorResidual)*PjeDepreciacion/100*(DATEDIFF(year, FechaCompra, GETDATE()))) AS ValorEnLibros, 
			CodSede
		FROM ACTIVOS
		WHERE PjeDepreciacion IS NOT NULL AND Estado != 'E' AND CodSede = @CodigoSede
		) AS Temp2

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

CREATE PROCEDURE spGetActivosEmpleado 
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
	 		PrecioCompra - ((PrecioCompra-ValorResidual)*PjeDepreciacion/100*(DATEDIFF(year, FechaCompra, GETDATE()))) AS ValorEnLibros, 
			CodSede
		FROM ACTIVOS
		WHERE PjeDepreciacion IS NOT NULL AND Estado != 'E' AND CodEmpleado = @CodigoEmpleado
		) AS Temp2

	SELECT CodEmpleado, COUNT(CodActivo) AS ActivosAsignados,
		SUM(PrecioCompra) AS CostoInicial,
		SUM(ValorEnLibros) AS CostoEnLibros,  
		SUM(ValorResidual) AS CostoResidual, 
	
		AVG(PrecioCompra) AS PromedioInicial,
		AVG(ValorEnLibros) AS PromedioEnLibros,
		AVG(ValorResidual) AS PromedioResidual,

		SUM(PrecioCompra)/@TipoDeCambio AS CostoInicialDolares,
		SUM(ValorEnLibros)/@TipoDeCambio AS CostoEnLibrosDolares,
		SUM(ValorResidual)/@TipoDeCambio AS CostoResidualDolares,

		AVG(PrecioCompra)/@TipoDeCambio AS PromedioInicialDolares,
		AVG(ValorEnLibros)/@TipoDeCambio AS PromedioEnLibrosDolares,
		AVG(ValorResidual)/@TipoDeCambio AS PromedioResidualDolares
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
*/
CREATE PROCEDURE spActivosEnRango
	@CodigoSede INT,
	@FechaInicio DATE, 
	@FechaFinal DATE, 
	@Categoria VARCHAR(50)
AS
	IF @Categoria = 'None' OR @Categoria = 'Ninguna'
		SELECT  CodActivo, A.Nombre AS NombreActivo, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AñosVidaUtil, A.CodEmpleado, E.Nombre AS NombreEmpleado
		FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado 
		WHERE A.Estado = 'A' AND A.CodSede=@CodigoSede AND Categoria IS NULL AND @FechaInicio<=FechaCompra AND @FechaFinal>=DATEADD(year,VidaUtil/365,FechaCompra)
	ELSE
		SELECT  CodActivo, A.Nombre AS NombreActivo, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AñosVidaUtil, A.CodEmpleado, E.Nombre AS NombreEmpleado
		FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado 
		WHERE A.Estado = 'A' AND A.CodSede=@CodigoSede AND Categoria = @Categoria AND @FechaInicio<=FechaCompra AND @FechaFinal<=DATEADD(year,VidaUtil/365,FechaCompra)
	
GO

/*
Monto total de los activos asignados a TODAS las sedes

cantidad de activos asignados, el monto total de los activos según
el costo inicial, el monto total de los activos según el valor residual y el monto total de los
activos según el valor en libros a la fecha de la consulta. La consulta debe mostrar los montos
en colones y en dólares,
*/
CREATE PROCEDURE spGetActivosPorSede
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
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, DATEDIFF(year, FechaCompra, GETDATE()) AS AñosUso,
	 		PrecioCompra - ((PrecioCompra-ValorResidual)*PjeDepreciacion/100*(DATEDIFF(year, FechaCompra, GETDATE()))) AS ValorEnLibros, 
			CodSede
		FROM ACTIVOS
		WHERE PjeDepreciacion IS NOT NULL AND Estado != 'E'
		) AS Temp2

	SELECT CodSede, 
		COUNT(CodSede) AS ActivosAsignados,
		SUM(PrecioCompra) AS CostoInicialColones,
		SUM(ValorEnLibros) AS CostoEnLibrosColones,  
		SUM(ValorResidual) AS CostoResidualColones, 
		SUM(PrecioCompra)/@TipoDeCambio AS CostoInicialDolares,
		SUM(ValorEnLibros)/@TipoDeCambio AS CostoEnLibrosDolares,
		SUM(ValorResidual)/@TipoDeCambio AS CostoResidualDolares
	FROM #TempTable2
	GROUP BY CodSede
GO


/*
Detalle de activos asignados en TODAS las sedes para un rango de años en particular, para este
rango debe tomar en cuenta la fecha de compra del activo y los años de vida útil, la
información que se debe mostrar para cada activo que se encuentre en el rango indicado es:
código del activo, nombre del activo, valor inicial del activo, valor residual, categoría, fecha
de compra, años de vida útil, empleado que lo tiene asignado. Este reporte se puede hacer
para todos los activos que cumplan con el rango establecido en los parámetros o para los
activos que cumplan con el rango y que pertenezcan a una categoría específica.
*/
CREATE PROCEDURE spActivosEnRangoPorSede
	@FechaInicio DATE, 
	@FechaFinal DATE, 
	@Categoria VARCHAR(50)
AS
	IF @Categoria = 'None' OR @Categoria = 'Ninguna'
		SELECT  A.CodSede, A.Nombre AS NombreActivo, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AñosVidaUtil, A.CodEmpleado, E.Nombre AS NombreEmpleado
		FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado 
		WHERE A.Estado = 'A' AND Categoria IS NULL AND @FechaInicio<=FechaCompra AND @FechaFinal>=DATEADD(year,VidaUtil/365,FechaCompra)
		ORDER BY A.CodSede, A.CodActivo
	ELSE
		SELECT  A.CodSede, CodActivo, A.Nombre AS NombreActivo, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AñosVidaUtil, A.CodEmpleado, E.Nombre AS NombreEmpleado
		FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado 
		WHERE A.Estado = 'A' AND Categoria = @Categoria AND @FechaInicio<=FechaCompra AND @FechaFinal<=DATEADD(year,VidaUtil/365,FechaCompra)
		ORDER BY A.CodSede, A.CodActivo
GO

/*
Listado de los 3 empleados que tienen mayor cantidad de activos asignados a la fecha. Se
debe mostrar la información de cada empleado, la cantidad de activos asignados por
empleado y el detalle de los activos asignados.
*/
CREATE PROCEDURE spTop3EmpleadoConMasActivos
AS
	IF OBJECT_ID('dbo.#TempTable3', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable3; 

	/*Tabla intermedia para coseguir a los top 3*/
	SELECT TOP 3 E.CodEmpleado, COUNT(A.CodActivo) AS CantidadActivos INTO #TempTable3
	FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado
	WHERE A.Estado = 'A'
	GROUP BY E.CodEmpleado
	ORDER BY CantidadActivos DESC

	SELECT E.CodEmpleado, E.Nombre AS NombreEmpleado, E.Cedula, E.CodSede AS CodSedeEmpleado, A.CodActivo, A.Nombre AS NombreActivo, A.Categoria, A.Descripcion, A.CodSede AS CodSedeActivo, A.DetalleUbicacion
	FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado, #TempTable3
	WHERE #TempTable3.CodEmpleado=E.CodEmpleado
	ORDER BY E.CodEmpleado, A.CodActivo

GO


/*
Listado de los 3 empleados cuya suma del valor en libros de los activos asignados es mayor
Se debe mostrar la información de cada empleado y la de los activos asignados.
*/
CREATE PROCEDURE spTop3EmpleadoConMasValor
	/*@TipoDeCambio FLOAT*/
AS
	IF OBJECT_ID('dbo.#TempTable', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable; 
	IF OBJECT_ID('dbo.#TempTable2', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable2; 
	IF OBJECT_ID('dbo.#TempTable3', 'U') IS NOT NULL 
		DROP TABLE dbo.#TempTable3; 

	SELECT CodActivo, Nombre, Categoria, PrecioCompra, ValorResidual, VidaUtil/365 AS AñosVidaUtil, 
	DATEDIFF(year, FechaCompra, GETDATE())-1 AS AñosUso, VidaUtil/365*( VidaUtil/365+1)/2 AS Factor, CodEmpleado INTO #TempTable
	FROM ACTIVOS
	WHERE PjeDepreciacion IS NULL AND Estado != 'E'

	SELECT * INTO #TempTable2
	FROM (
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, AñosUso+1 AS AñosUso,
	 		PrecioCompra-(PrecioCompra-ValorResidual)* (1/CONVERT(Float,Factor)*((AñosUso+1)*AñosVidaUtil-(AñosUso*AñosUso+AñosUso)/2.0)) AS ValorEnLibros, CodEmpleado
		FROM #TempTable
		UNION
		SELECT CodActivo, Nombre, PrecioCompra, ValorResidual, DATEDIFF(year, FechaCompra, GETDATE()) AS AñosUso,
	 		PrecioCompra - ((PrecioCompra-ValorResidual)*PjeDepreciacion/100*(DATEDIFF(year, FechaCompra, GETDATE()))) AS ValorEnLibros, CodEmpleado
		FROM ACTIVOS
		WHERE PjeDepreciacion IS NOT NULL AND Estado != 'E'
		) AS Temp2

	SELECT TOP 3 CodEmpleado
		/*COUNT(CodEmpleado) AS ActivosAsignados,
		SUM(PrecioCompra) AS CostoInicial,
		SUM(ValorEnLibros) AS CostoEnLibros
		SUM(ValorResidual) AS CostoResidual, 
		SUM(PrecioCompra)/@TipoDeCambio AS CostoInicialDolares,
		SUM(ValorEnLibros)/@TipoDeCambio AS CostoEnLibrosDolares,
		SUM(ValorResidual)/@TipoDeCambio AS CostoResidualDolares*/
		INTO #TempTable3
	FROM #TempTable2
	GROUP BY CodEmpleado

	SELECT E.CodEmpleado, E.Nombre AS NombreEmpleado, E.Cedula, E.CodSede AS CodSedeEmpleado, A.CodActivo, A.Nombre AS NombreActivo, A.Categoria, A.Descripcion, A.CodSede AS CodSedeActivo, A.DetalleUbicacion
	FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado, #TempTable3
	WHERE #TempTable3.CodEmpleado=E.CodEmpleado
	ORDER BY E.CodEmpleado, A.CodActivo

GO









/*

AS
	SELECT TOP 3 E.CodEmpleado, E.Nombre, E.Cedula, E.Puesto, COUNT(A.CodActivo) AS CantidadActivos, SUM(PrecioCompra) AS PrecioTotal
	FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado
	WHERE A.Estado = 'A'
	GROUP BY E.CodEmpleado, E.Nombre, E.Cedula, E.Puesto
	ORDER BY PrecioTotal DESC
GO

*/