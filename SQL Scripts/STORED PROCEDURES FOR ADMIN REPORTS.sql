USE AdvancedInc
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spAssetsAssignedVenue')
	DROP PROCEDURE spAssetsAssignedVenue
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spEmployeeValueBooks')
	DROP PROCEDURE spEmployeeValueBooks
GO

CREATE PROCEDURE spAssetsAssignedVenue
	@VenueName VARCHAR(50)
AS
	SELECT Activos.Nombre AS Activo, Sedes.Nombre AS Sede, 
	COUNT(Activos.CodSede) AS cantidadActivos, SUM(PrecioCompra) AS TotalActCostInicial, SUM(ValorResidual) AS TotalActPrecResidual
	FROM Activos
	INNER JOIN Sedes ON Activos.CodSede = Sedes.CodSede
	WHERE Sedes.Nombre = @VenueName
	GROUP BY Activos.Nombre, Sedes.Nombre
GO

CREATE PROCEDURE spEmployeeValueBooks
AS
	SELECT TOP(3) e.Nombre, SUM(PrecioCompra) AS valor
    FROM Activos a, Empleados e
    WHERE a.CodEmpleado = e.CodEmpleado
    GROUP BY e.Nombre 
    ORDER BY Valor DESC
GO
