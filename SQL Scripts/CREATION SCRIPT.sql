USE master
CREATE DATABASE AdvancedInc

USE AdvancedInc 

CREATE TABLE USUARIOS (
	CodUsuario INT IDENTITY(1,1),
	Nombre VARCHAR(50),
	Contrasena VARCHAR(50),
	Roll CHAR,

	CONSTRAINT PK_CodUsuario 
		PRIMARY KEY (CodUsuario)
)

CREATE TABLE DEPARTAMENTOS (
	CodDepartamento INT IDENTITY(1,1),
	Nombre VARCHAR(50),
	Descripcion VARCHAR(50),
	Estado CHAR,
	
	CONSTRAINT PK_CodDepartamento 
		PRIMARY KEY (CodDepartamento)
) 

CREATE TABLE SEDES (
	CodSede INT IDENTITY(1,1),
	Nombre VARCHAR(50),
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
	Estado CHAR,
	Fotgrafia IMAGE,
	CodSede INT, 
	CodDepartamento INT,
	FechaIngreso DATE,
	Puesto VARCHAR(50),
	Cedula INT,

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
	TiempoGarantia DATE,
	VidaUtil INT, /*DIAS*/
	PtjeDepreciacion FLOAT,
	FechaCompra DATE,
	FechaRegistro DATE,
	Estado CHAR,
	CentroCosto INT,
	ValorResidual INT,
	CodSede INT,
	DetalleUbicacion VARCHAR(200)

	CONSTRAINT PK_CodActivo 
		PRIMARY KEY (CodActivo),

	CONSTRAINT FK_ACTIVOS_CodSede
		FOREIGN KEY (CodSede) REFERENCES SEDES(CodSede),

	CONSTRAINT FK_ACTIVOS_CentroCosto
		FOREIGN KEY (CentroCosto) REFERENCES DEPARTAMENTOS(CodDepartamento)
);

