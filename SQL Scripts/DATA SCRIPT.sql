USE AdvancedInc
GO

	/* Usuarios */
INSERT INTO USUARIOS (Nombre, Contrasena, Roll) 
	VALUES ('user', '1234', 'U')
INSERT INTO USUARIOS (Nombre, Contrasena, Roll) 
	VALUES ('admin', '1234', 'A')

	/* Telecomunicaciones */
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Telecomunicaciones', 'Departamento de comunicaciones', 'A') 
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Forjas', 'Departamento de produccion tecnologica', 'A')
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Recursos Humanos', 'Departamento de recursos humanos', 'A')
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Reliquiarios', 'Departamento de tecnolog�as perdidas', 'A')
INSERT INTO DEPARTAMENTOS (Nombre, Descripcion, Estado) 
	VALUES ('Manufactorios', 'Departamento de producci�n manual', 'A')

	/* Sedes */
INSERT INTO SEDES (Nombre, Descripcion, Provincia, Canton, Distrito, DetalleUbicacion, Estado, CodEmpleado, FechaIngresoAdmin) 
	VALUES ('Avernii', 'Primer Sede', 'Heredia', 'Barva', 'San Jose de la monta�a', 'Por la monta�a', 'A', NULL, NULL)
INSERT INTO SEDES (Nombre, Descripcion, Provincia, Canton, Distrito, DetalleUbicacion, Estado, CodEmpleado, FechaIngresoAdmin) 
	VALUES ('Garrsak', 'Seguda Sede', 'Alajuela', 'Orotina', 'La Ceiba', 'Por el r�o', 'A', NULL, NULL) 
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
	VALUES ('Daniela', 123, NULL, 1, 1, '03/26/2015', 'T�cnico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Samuel', 234, NULL, 1, 1, '03/26/2015', 'Ps�quico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Veronica', 345, NULL, 1, 1, '03/26/2015', 'T�cnico', 'A')
INSERT INTO EMPLEADOS (Nombre, Cedula, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Estado)
	VALUES ('Fiorella', 456, NULL, 2, 2, '03/26/2015', 'T�cnico', 'A')
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


	/* Activos */
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', 9490, 2, 10, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', 9490, 2, 10, 2, 'S')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', 9490, 2, 10, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Omnispex', 'Sensor de largo alcance multidireccional', 'Utilidades', 10640, 720, 20, '05/17/2018', '05/19/2018', '05/14/2019', 9490, 2, 3, 1, 'E')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/05/2013', '05/05/2013', '05/14/2020', 15568, 1, 1, 1, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/05/2013', '05/05/2013', '05/14/2020', 15568, 1, 2, 2, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/05/2013', '05/05/2013', '05/14/2020', 15568, 1, 3, 3, 'E')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', 15568, 1, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', 15568, 1, 2, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', 15568, 1, 3, 3, 'G')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', 15568, 1, 4, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', 15568, 1, 6, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Radio Vox', 'Sistema de radio inal�mbrico', 'Comunicaciones', 18000, 1800, 10, '05/17/2018', '05/20/2018', '05/14/2020', 15568, 1, 7, 2, 'S')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Faro de Teletransportacion', 'Emisor de se�al orbital', 'Especialidades', 164500, 5400, NULL, '07/24/2000', '07/27/2001', '05/14/2010', 120000, 4, 1, 1, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Faro de Teletransportacion', 'Emisor de se�al orbital', 'Especialidades', 164500, 5400, NULL, '07/14/2012', '07/27/2012', '05/14/2022', 120000, 4, 12, 3, 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Binoculares', 'Instrumento de optimizaci�n ocular', 'Utilidades', 8500, 3650, NULL, '07/24/2017', '07/27/2017', '05/14/2020', 5000, 5, 10, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Binoculares', 'Instrumento de optimizaci�n ocular', 'Utilidades', 8500, 3650, NULL, '07/24/2017', '07/27/2017', '05/14/2020', 5000, 5, 10, 3, 'G')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Binoculares', 'Instrumento de optimizaci�n ocular', 'Utilidades', 8500, 3650, NULL, '07/24/2017', '07/27/2017', '05/14/2020', 5000, 5, 7, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Binoculares', 'Instrumento de optimizaci�n ocular', 'Utilidades', 8500, 3650, NULL, '07/24/2017', '07/27/2017', '05/14/2020', 5000, 5, 14, 3, 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Asistente Rob�tico', 'Drone impulsado por tecnolog�a anti-gravedad', 'Especialidades', 75000, 7300, NULL, '02/14/2014', '02/17/2014', '02/14/2018', 47500, 4, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Asistente Rob�tico', 'Drone impulsado por tecnolog�a anti-gravedad', 'Especialidades', 75000, 7300, NULL, '02/14/2015', '02/17/2015', '02/14/2019', 47500, 4, 2, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Asistente Rob�tico', 'Drone impulsado por tecnolog�a anti-gravedad', 'Especialidades', 75000, 7300, NULL, '02/14/2016', '02/17/2016', '02/14/2020', 47500, 4, 3, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Asistente Rob�tico', 'Drone impulsado por tecnolog�a anti-gravedad', 'Especialidades', 75000, 7300, NULL, '02/14/2017', '02/17/2017', '02/14/2021', 47500, 4, 10, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Asistente Rob�tico', 'Drone impulsado por tecnolog�a anti-gravedad', 'Especialidades', 75000, 7300, NULL, '02/14/2018', '02/17/2018', '02/14/2022', 47500, 4, 6, 1, 'A')

	DELETE FROM ACTIVOS WHERE Nombre = 'Asistente Rob�tico'

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Beige 5+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '05/19/2017', '05/21/2017', '05/14/2018', 4392, 5, 1, 1, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Beige 5+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '05/19/2017', '05/21/2017', '05/14/2018', 4392, 5, 2, 2, 'E')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Beige 5+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '05/19/2017', '05/21/2017', '05/14/2018', 4392, 5, 3, 3, 'E')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Negro 5+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Negro 5+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 2, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Negro 5+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 3, 3, 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 4, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 5, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 6, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 7, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 8, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 9, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Rojo 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 10, 3, 'S')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Rojo 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 11, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Rojo 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 12, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 13, 3, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 14, 3, 'G')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Camiseta', 'Azul 6+ con la marca en la espalda', 'Utilidades', 5000, 550, 45, '02/19/2018', '02/21/2018', '02/14/2019', 4392, 5, 15, 3, 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Calculador', 'Tiene los valores del ejemplo', 'Especialidades', 6500, 1460, NULL, '08/12/2019', '08/14/2019', '02/14/2021', 500, 2, 4, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Calculador', 'Tiene los valores del ejemplo', 'Especialidades', 6500, 1460, NULL, '08/12/2018', '08/14/2018', '02/14/2020', 500, 2, 5, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Calculador', 'Tiene los valores del ejemplo', 'Especialidades', 6500, 1460, NULL, '08/12/2017', '08/14/2017', '02/14/2019', 500, 2, 6, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Calculador', 'Tiene los valores del ejemplo', 'Especialidades', 6500, 1460, NULL, '08/12/2016', '08/14/2016', '02/14/2018', 500, 2, 7, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES ('Calculador', 'Tiene los valores del ejemplo', 'Especialidades', 6500, 1460, NULL, '08/12/2015', '08/14/2015', '02/14/2017', 500, 2, 8, 2, 'A')

INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Sector A-79B', 'Propiedad de 2000 m2', 'Propiedades', 1800000, NULL, 0, '05/17/1995', '05/20/2018', NULL, 1800000, 3, 1, 1, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Sector K-25P', 'Propiedad de 2200 m2', 'Propiedades', 3800000, NULL, 0, '05/17/1990', '05/20/2018', NULL, 1800000, 3, 2, 2, 'A')
INSERT INTO ACTIVOS (Nombre, Descripcion, Categoria, PrecioCompra, VidaUtil, PjeDepreciacion, FechaCompra, FechaRegistro, FechaGarantia, ValorResidual, CentroCosto, Codempleado, CodSede, Estado)
	VALUES('Sector W-81V', 'Propiedad de 3500 m2', 'Propiedades', 5000000, NULL, 0, '05/17/1997', '05/20/2018', NULL, 1800000, 3, 3, 3, 'A')


	SELECT * FROM EMPLEADOS
	SELECT * FROM SEDES
	SELECT * FROM DEPARTAMENTOS
	SELECT * FROM USUARIOS
	SELECT * FROM ACTIVOS

	SELECT CodActivo, Nombre, PrecioCompra, VidaUtil/365 AS A�osVidaUtil, DATEDIFF(YEAR, FechaCompra, GETDATE()) AS A�osUso FROM ACTIVOS WHERE ValorResidual IS NULL