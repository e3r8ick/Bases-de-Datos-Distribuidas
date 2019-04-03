USE AdvancedInc
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spCreateUser')
	DROP PROCEDURE spCreateUser
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spSearchUser')
	DROP PROCEDURE spSearchUser
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spDeleteUser')
	DROP PROCEDURE spDeleteUser
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

CREATE PROCEDURE spDeleteUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50)
AS
	DELETE 
	FROM USUARIOS 
	WHERE NOMBRE=@UserName
		AND CONTRASENA=@UserPassword;
GO