USE AdvancedInc
GO

INSERT INTO USUARIOS (Nombre, Contrasena, Roll) 
	VALUES ('user', '1234', 'U')
INSERT INTO USUARIOS (Nombre, Contrasena, Roll) 
	VALUES ('admin', '1234', 'A')

INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Telecomunicaciones', 'Departamento de comunicaciones', 'A') 
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Forjas', 'Departamento de produccion tecnologica', 'A')
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Recursos Humanos', 'Departamento de recursos humanos', 'A')
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Reliquiarios', 'Departamento de tecnologías perdidas', 'A')
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Manufactorios', 'Departamento de producción manual', 'A')

INSERT INTO SEDES (Nombre, Descripcion, Provincia, Canton, Distrito, DetalleUbicacion, Estado, CodEmpleado, FechaIngresoAdmin) 
	VALUES ('Avernii', 'Primer Sede', 'Heredia', 'Barva', 'San Jose de la montaña', 'Por la montaña', 'A', NULL, NULL)
INSERT INTO SEDES (Nombre, Descripcion, Provincia, Canton, Distrito, DetalleUbicacion, Estado, CodEmpleado, FechaIngresoAdmin) 
	VALUES ('Garrsak', 'Seguda Sede', 'Alajuela', 'Orotina', 'La Ceiba', 'Por el río', 'A', NULL, NULL) 
INSERT INTO SEDES (Nombre, Descripcion, Provincia, Canton, Distrito, DetalleUbicacion, Estado, CodEmpleado, FechaIngresoAdmin) 
	VALUES ('Raukaan', 'Tercer Sede', 'Cartago', 'Oriental', 'Central', 'Por el TEC', 'A', NULL, NULL) 

/*Administradores*/
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Stronos', 54782, NULL, 1, 2, '03/26/2015', 'Administrador', 'A')
UPDATE SEDES SET CodEmpleado=1, FechaIngresoAdmin='03/26/2015' WHERE SEDES.CodSede = 1

INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Arven', 987645, NULL, 2, 4, '03/26/2015', 'Administrador', 'A')
UPDATE SEDES SET CodEmpleado=2, FechaIngresoAdmin='03/26/2015' WHERE SEDES.CodSede = 2

INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Teremir', 147828, NULL, 3, 1, '03/26/2015', 'Administrador', 'A')
UPDATE SEDES SET CodEmpleado=3, FechaIngresoAdmin='03/26/2015' WHERE SEDES.CodSede = 3

/*Empleados*/
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Daniela', 123, NULL, 1, 1, '03/26/2015', 'Técnico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Samuel', 234, NULL, 1, 1, '03/26/2015', 'Psíquico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Veronica', 345, NULL, 1, 1, '03/26/2015', 'Técnico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Fiorella', 456, NULL, 2, 2, '03/26/2015', 'Técnico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Eduardo', 567, NULL, 2, 2, '03/26/2015', 'Soporte', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Esteban', 678, NULL, 2, 3, '03/26/2015', 'Psiquiatra', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Jimena', 789, NULL, 3, 4, '03/26/2015', 'Buscador', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Beatriz', 890, NULL, 3, 4, '03/26/2015', 'Organizador', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Isaac', 136, NULL, 3, 4, '03/26/2015', 'Investigador', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('John', 386, NULL, 3, 5, '03/26/2015', 'Soporte', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Kimberly', 578, NULL, 3, 5, '03/26/2015', 'Operador', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Erick', 846, NULL, 3, 5, '03/26/2015', 'Operador', 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', NULL, 2, 10, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', NULL, 2, 10, 2, 'S')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', NULL, 2, 10, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', NULL, 2, 3, 1, 'E')

	SELECT * FROM ACTIVOS
	SELECT * FROM EMPLEADOS

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/05/2013', '05/05/2013', '05/14/2020', NULL, 2, 1, 1, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/05/2013', '05/05/2013', '05/14/2020', NULL, 2, 2, 2, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/05/2013', '05/05/2013', '05/14/2020', NULL, 2, 3, 3, 'E')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', NULL, 2, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', NULL, 2, 2, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', NULL, 2, 3, 3, 'G')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', NULL, 2, 4, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', NULL, 2, 6, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inalámbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', NULL, 2, 7, 2, 'S')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Faro de Teletransportacion', 'Emisor de señal orbital', 'Especialidades', 164500, 5400, 3, '07/24/2000', '07/27/2001', '05/14/2010', NULL, 4, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Faro de Teletransportacion', 'Emisor de señal orbital', 'Especialidades', 164500, 5400, 3, '07/14/2012', '07/27/2012', '05/14/2022', NULL, 4, 12, 3, 'A')


INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Beige 5+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '05/19/2017', '05/21/2017', '05/14/2018', NULL, 5, 1, 1, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Beige 5+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '05/19/2017', '05/21/2017', '05/14/2018', NULL, 5, 2, 2, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Beige 5+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '05/19/2017', '05/21/2017', '05/14/2018', NULL, 5, 3, 3, 'E')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Negro 5+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Negro 5+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 2, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Negro 5+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 3, 3, 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 4, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 5, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 6, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 7, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 8, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 9, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Rojo 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 10, 3, 'S')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Rojo 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 11, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Rojo 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 12, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 13, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 14, 3, 'G')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camisetas', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 360, 45, '02/19/2018', '02/21/2018', '02/14/2019', NULL, 5, 15, 3, 'A')


	SELECT * FROM EMPLEADOS
	SELECT * FROM SEDES
	SELECT * FROM DEPARTAMENTOS
	SELECT * FROM USUARIOS
	SELECT * FROM ACTIVOS