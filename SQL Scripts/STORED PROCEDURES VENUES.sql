USE AdvancedInc
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spCreateVenue')
	DROP PROCEDURE spCreateVenue
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchVenue')
	DROP PROCEDURE spSearchVenue
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchAllVenues')
	DROP PROCEDURE spSearchAllVenues
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spDeleteVenue')
	DROP PROCEDURE spDeleteVenue
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spUpdateVenue')
	DROP PROCEDURE spUpdateVenue
GO

CREATE PROCEDURE spCreateVenue
	@VenueName VARCHAR(50),
	@VenueDescription VARCHAR(50),
	@VenueProvincia VARCHAR(50),
	@VenueCanton VARCHAR(50),
	@VenueDistrito VARCHAR(50),
	@VenueUbicationDetail VARCHAR(50),
	@VenueStatus CHAR,
	@VenueCodEmpleado INT,
	@VenueAdminDate DATE
AS
	INSERT INTO SEDES
		(Nombre, Descripcion, Provincia, Canton, Distrito, DetalleUbicacion, Estado, CodEmpleado, FechaIngresoAdmin) 
	VALUES 
		(@VenueName, @VenueDescription, @VenueProvincia, @VenueCanton, @VenueDistrito, @VenueUbicationDetail, @VenueStatus, @VenueCodEmpleado, @VenueAdminDate)
GO

CREATE PROCEDURE spSearchVenue 
	@VenueCode INT
AS
	SELECT * 
	FROM SEDES 
	WHERE CodSede=@VenueCode;
GO

CREATE PROCEDURE spSearchAllVenues 
AS
	SELECT * 
	FROM SEDES;
GO

CREATE PROCEDURE spDeleteVenue 
	@VenueCode VARCHAR(50)
AS
	DELETE 
	FROM SEDES 
	WHERE CodSede=@VenueCode;
GO

CREATE PROCEDURE spUpdateVenue
	@VenueCode VARCHAR(50),
	@VenueName VARCHAR(50),
	@VenueDescription VARCHAR(50),
	@VenueProvincia VARCHAR(50),
	@VenueCanton VARCHAR(50),
	@VenueDistrito VARCHAR(50),
	@VenueUbicationDetail VARCHAR(50),
	@VenueStatus CHAR,
	@VenueCodEmpleado INT,
	@VenueAdminDate DATE
AS
	UPDATE SEDES
	SET 
		Nombre = @VenueName, Descripcion = @VenueDescription, Provincia = @VenueProvincia, Canton = @VenueCanton, Distrito = @VenueDistrito, DetalleUbicacion = @VenueUbicationDetail, Estado = @VenueStatus, CodEmpleado = @VenueCodEmpleado, FechaIngresoAdmin = @VenueAdminDate
	WHERE
		CodSede = @VenueCode
GO