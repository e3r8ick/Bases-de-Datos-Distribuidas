DROP PROCEDURE spCreateEmployee;

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
	INSERT INTO EMPLEADOS (Nombre, Estado, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Cedula) 
	VALUES 
		(@EmployeeName, @EmployeeStatus, @EmployeePhoto, @EmployeeCodSede, @EmployeeCodDepartamento, @EmployeeDate, @EmployeeJob, @EmployeeId)
GO

DROP PROCEDURE spSearchEmployee;

CREATE PROCEDURE spSearchEmployee 
	@EmployeeId INT
AS
	SELECT * 
	FROM EMPLEADOS 
	WHERE CEDULA=@EmployeeId;
GO

DROP PROCEDURE spDeleteEmployee;

CREATE PROCEDURE spDeleteEmployee 
	@EmployeeId VARCHAR(50)
AS
	DELETE 
	FROM EMPLEADOS 
	WHERE CEDULA=@EmployeeId;
GO