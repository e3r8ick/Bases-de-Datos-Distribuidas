USE master
CREATE DATABASE AdvancedInc
GO

USE AdvancedInc 
GO

CREATE TABLE USUARIOS (
	CodUsuario INT IDENTITY(1,1),
	Nombre VARCHAR(50) UNIQUE,
	Contrasena VARCHAR(50) DEFAULT '1234',
	Roll CHAR,

	CONSTRAINT PK_CodUsuario 
		PRIMARY KEY (CodUsuario)
)


CREATE TABLE DEPARTAMENTOS (
	CodDepartamento INT IDENTITY(1,1),
	Nombre VARCHAR(50) UNIQUE,
	Descripcion VARCHAR(50),
	Estado CHAR,
	
	CONSTRAINT PK_CodDepartamento 
		PRIMARY KEY (CodDepartamento)
) 

CREATE TABLE SEDES (
	CodSede INT IDENTITY(1,1),
	Nombre VARCHAR(50) UNIQUE,
	Descripcion VARCHAR(50),
	Provincia VARCHAR(50),
	Canton VARCHAR(50),
	Distrito VARCHAR(50),
	DetalleUbicacion VARCHAR(50),
	Estado CHAR,
	CodEmpleado INT,
	FechaIngresoAdmin DATE,

	CONSTRAINT PK_CodSede 
		PRIMARY KEY (CodSede)
)


CREATE TABLE EMPLEADOS (
	CodEmpleado INT IDENTITY (1,1),
	Nombre VARCHAR(50),
	Cedula INT UNIQUE,
	Fotografia IMAGE,
	CodSede INT, 
	CodDepartamento INT,
	FechaIngreso DATE,
	Puesto VARCHAR(50),
	Estado CHAR,

	CONSTRAINT PK_CodEmpleado 
		PRIMARY KEY (CodEmpleado),

	CONSTRAINT FK_EMPLEADOS_CodSede
		FOREIGN KEY (CodSede) REFERENCES SEDES(CodSede),

	CONSTRAINT FK_EMPLEADOS_CodDepartamento
		FOREIGN KEY (CodDepartamento) REFERENCES DEPARTAMENTOS(CodDepartamento)
);


CREATE TABLE ACTIVOS (
	CodActivo INT IDENTITY (1,1),
	Nombre VARCHAR(50),
	Descripcion VARCHAR(50),
	Categoria VARCHAR(50),
	Foto IMAGE, 
	PrecioCompra INT,
	VidaUtil INT, /*DIAS*/
	PjeDepreciacion FLOAT,
	FechaCompra DATE,
	FechaRegistro DATE,
	FechaGarantia DATE,
	ValorResidual INT,
	CentroCosto INT,
	CodEmpleado INT,
	CodSede INT,
	DetalleUbicacion VARCHAR(200),
	Estado CHAR,

	CONSTRAINT PK_CodActivo 
		PRIMARY KEY (CodActivo),

	CONSTRAINT FK_ACTIVOS_CodSede
		FOREIGN KEY (CodSede) REFERENCES SEDES(CodSede),

	CONSTRAINT FK_ACTIVOS_CodEmpleado
		FOREIGN KEY (CodEmpleado) REFERENCES EMPLEADOS(CodEmpleado),

	CONSTRAINT FK_ACTIVOS_CentroCosto
		FOREIGN KEY (CentroCosto) REFERENCES DEPARTAMENTOS(CodDepartamento)
);


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spCreateAsset')
	DROP PROCEDURE spCreateAsset
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchAsset')
	DROP PROCEDURE spSearchAsset
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchAllAssets')
	DROP PROCEDURE spSearchAllAssets
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spDeleteAsset')
	DROP PROCEDURE spDeleteAsset
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spUpdateAsset')
	DROP PROCEDURE spUpdateAsset
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spAssignAsset')
	DROP PROCEDURE spAssignAsset
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spStatusUpdateAsset')
	DROP PROCEDURE spStatusUpdateAsset
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spCreateEmployee')
	DROP PROCEDURE spCreateEmployee
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchEmployee')
	DROP PROCEDURE spSearchEmployee
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchAllEmployees')
	DROP PROCEDURE spSearchAllEmployees
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spDeleteEmployee')
	DROP PROCEDURE spDeleteEmployee
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spUpdateEmployee')
	DROP PROCEDURE spUpdateEmployee
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spCreateUser')
	DROP PROCEDURE spCreateUser
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchUser')
	DROP PROCEDURE spSearchUser
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchAllUsers')
	DROP PROCEDURE spSearchAllUsers
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spDeleteUser')
	DROP PROCEDURE spDeleteUser
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

CREATE PROCEDURE spCreateAsset
	@AssetName VARCHAR(50),
	@AssetDescription VARCHAR(50),
	@AssetCategory VARCHAR(50),
	@AssetPhoto IMAGE, 
	@AssetPrice INT,
	@AssetLifeSpan INT, /*DIAS*/
	@AssetPjeDepreciacion FLOAT,
	@AssetBuyingDate DATE,
	@AssetRegistrationDate DATE,
	@AssetWarrantyDate DATE,
	@AssetValorResidual INT,
	@AssetCentroCosto INT,
	@AssetCodEmployee INT,
	@AssetCodVenue INT,
	@AssetUbicationDetail VARCHAR(200),
	@AssetStatus CHAR
AS
	INSERT INTO ACTIVOS
		(Nombre, Descripcion, Categoria, Foto, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, CodEmpleado, CodSede, DetalleUbicacion, Estado)
	VALUES 
		(@AssetName, @AssetDescription, @AssetCategory, @AssetPhoto, @AssetPrice, @AssetLifeSpan, @AssetPjeDepreciacion, @AssetBuyingDate, @AssetRegistrationDate, @AssetWarrantyDate, @AssetValorResidual, @AssetCentroCosto, @AssetCodEmployee, @AssetCodVenue, @AssetUbicationDetail, @AssetStatus)
GO

CREATE PROCEDURE spSearchAsset 
	@AssetCode INT
AS
	SELECT * 
	FROM ACTIVOS 
	WHERE CodActivo=@AssetCode;
GO

CREATE PROCEDURE spSearchAllAssets 
AS
	SELECT * 
	FROM ACTIVOS;
GO

CREATE PROCEDURE spDeleteAsset 
	@AssetCode VARCHAR(50)
AS
	DELETE 
	FROM ACTIVOS 
	WHERE CodActivo=@AssetCode;
GO

CREATE PROCEDURE spUpdateAsset
	@AssetCode INT,
	@AssetName VARCHAR(50),
	@AssetDescription VARCHAR(50),
	@AssetCategory VARCHAR(50),
	@AssetPhoto IMAGE, 
	@AssetPrice INT,
	@AssetLifeSpan INT, /*DIAS*/
	@AssetPjeDepreciacion FLOAT,
	@AssetBuyingDate DATE,
	@AssetRegistrationDate DATE,
	@AssetWarrantyDate DATE,
	@AssetValorResidual INT,
	@AssetCentroCosto INT,
	@AssetCodEmployee INT,
	@AssetCodVenue INT,
	@AssetUbicationDetail VARCHAR(200),
	@AssetStatus CHAR
AS
	UPDATE ACTIVOS
	SET 
		Nombre = @AssetName, Descripcion = @AssetDescription, Categoria = @AssetCategory, Foto = @AssetPhoto, PrecioCompra = @AssetPrice, VidaUtil = @AssetLifeSpan, PjeDepreciacion = @AssetPjeDepreciacion, FechaCompra = @AssetBuyingDate, FechaRegistro = @AssetRegistrationDate, FechaGarantia = @AssetWarrantyDate, ValorResidual = @AssetValorResidual, CentroCosto = @AssetCentroCosto, CodEmpleado = @AssetCodEmployee, CodSede = @AssetCodVenue, DetalleUbicacion = @AssetUbicationDetail, Estado = @AssetStatus
	WHERE
		CodActivo = @AssetCode
GO

CREATE PROCEDURE spAssignAsset
	@AssetCode INT,
	@AssetRegistrationDate DATE,
	@AssetCodEmployee INT,
	@AssetCodVenue INT,
	@AssetUbicationDetail VARCHAR(200)
AS
	UPDATE ACTIVOS
	SET 
		FechaRegistro = @AssetRegistrationDate, CodEmpleado = @AssetCodEmployee, CodSede = @AssetCodVenue, DetalleUbicacion = @AssetUbicationDetail
	WHERE
		CodActivo = @AssetCode
GO

CREATE PROCEDURE spStatusUpdateAsset
	@AssetCode INT,
	@AssetStatus CHAR
AS
	UPDATE ACTIVOS
	SET 
		 Estado = @AssetStatus
	WHERE
		CodActivo = @AssetCode
GO

CREATE PROCEDURE spCreateEmployee
	@EmployeeName VARCHAR(50),
	@EmployeeStatus CHAR,
	@EmployeePhoto IMAGE,
	@EmployeeCodSede INT,
	@EmployeeCodDepartamento INT,
	@EmployeeDate DATE,
	@EmployeeJob VARCHAR(50),
	@EmployeeId INT
AS
	INSERT INTO EMPLEADOS
		(Nombre, Estado, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Cedula) 
	VALUES 
		(@EmployeeName, @EmployeeStatus, @EmployeePhoto, @EmployeeCodSede, @EmployeeCodDepartamento, @EmployeeDate, @EmployeeJob, @EmployeeId)
GO

CREATE PROCEDURE spSearchEmployee 
	@EmployeeId INT
AS
	SELECT * 
	FROM EMPLEADOS 
	WHERE CEDULA=@EmployeeId;
GO

CREATE PROCEDURE spSearchAllEmployees 
AS
	SELECT * 
	FROM EMPLEADOS;
GO

CREATE PROCEDURE spDeleteEmployee 
	@EmployeeId VARCHAR(50)
AS
	DELETE 
	FROM EMPLEADOS 
	WHERE CEDULA=@EmployeeId;
GO

CREATE PROCEDURE spUpdateEmployee
	@EmployeeName VARCHAR(50),
	@EmployeeStatus CHAR,
	@EmployeePhoto IMAGE,
	@EmployeeCodSede INT,
	@EmployeeCodDepartamento INT,
	@EmployeeDate DATE,
	@EmployeeJob VARCHAR(50),
	@EmployeeId INT
AS
	UPDATE EMPLEADOS
	SET 
		Nombre = @EmployeeName, Estado = @EmployeeStatus, Fotografia = @EmployeePhoto, CodSede = @EmployeeCodSede, CodDepartamento = @EmployeeCodDepartamento, FechaIngreso = @EmployeeDate, Puesto = @EmployeeJob
	WHERE
		Cedula = @EmployeeId
GO

CREATE PROCEDURE spCreateUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50),
	@UserRol CHAR
AS
	INSERT INTO USUARIOS (Nombre, Contrasena, Roll) 
	VALUES 
		(@UserName, @UserPassword, @UserRol)
GO

CREATE PROCEDURE spSearchUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50)
AS
	SELECT ROLL 
	FROM USUARIOS 
	WHERE NOMBRE=@UserName
		AND CONTRASENA=@UserPassword;
GO

CREATE PROCEDURE spSearchAllUsers 
AS
	SELECT * 
	FROM USUARIOS;
GO

CREATE PROCEDURE spDeleteUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50)
AS
	DELETE 
	FROM USUARIOS 
	WHERE NOMBRE=@UserName
		AND CONTRASENA=@UserPassword;
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