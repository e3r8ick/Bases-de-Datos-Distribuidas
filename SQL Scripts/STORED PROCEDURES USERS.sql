DROP PROCEDURE spCreateUser;

CREATE PROCEDURE spCreateUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50),
	@UserRol CHAR
AS
	INSERT INTO USUARIOS (Nombre, Contrasena, Roll) 
	VALUES 
		(@UserName, @UserPassword, @UserRol)
GO

DROP PROCEDURE spSearchUser;

CREATE PROCEDURE spSearchUser 
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50)
AS
	SELECT ROLL 
	FROM USUARIOS 
	WHERE NOMBRE=@UserName
		AND CONTRASENA=@UserPassword;
GO