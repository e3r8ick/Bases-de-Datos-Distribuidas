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

