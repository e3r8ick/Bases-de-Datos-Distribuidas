USE AdvancedInc
GO

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

CREATE PROCEDURE spUpdateAssetStatus
	@AssetCode INT,
	@AssetStatus CHAR
AS
	UPDATE ACTIVOS
	SET 
		Estado = @AssetStatus
	WHERE
		CodActivo = @AssetCode
GO