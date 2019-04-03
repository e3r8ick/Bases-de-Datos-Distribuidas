USE AdvancedInc
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