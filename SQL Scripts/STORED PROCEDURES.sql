USE AdvancedInc
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_getActivosSede')
	DROP PROCEDURE SP_getActivosSede
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_getActivosEmpleado')
	DROP PROCEDURE SP_getActivosEmpleado
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_ActivosEnRango')
	DROP PROCEDURE SP_ActivosEnRango
GO



/*
Monto total de los activos asignados a la sede, en este reporte se muestra la cantidad de
activos asignados, el monto total de los activos seg�n el costo inicial, el monto total de
los activos seg�n el valor residual y el monto total de los activos seg�n el valor en libros
a la fecha de la consulta. La consulta debe mostrar los montos en colones y en d�lares,

Falta: precio en libros, definir ValorResidual, columnas con costo en dolares
*/
CREATE PROCEDURE SP_getActivosSede @TipoDeCambio FLOAT
AS
	SELECT S.CodSede, S.Nombre, COUNT(A.CodSede) AS ActivosAsignados, SUM(A.PrecioCompra) AS CostoInicial, SUM(A.ValorResidual) AS CostoResidual,
			SUM(A.PrecioCompra)*@TipoDeCambio AS CostoInicialDolares, SUM(A.ValorResidual)*@TipoDeCambio AS CostoResidualDolares
	FROM ACTIVOS AS A JOIN SEDES AS S ON A.CodSede = S.CodSede
	WHERE A.Estado = 'A'
	GROUP BY S.CodSede, S.Nombre
GO 

/* 
Monto total de los activos asignados seg�n empleado, en este reporte se muestra la
cantidad de activos asignados, el monto total y promedio de los activos seg�n el costo
inicial, el monto total y promedio de los activos seg�n el valor residual y el monto total y
promedio de los activos seg�n el valor en libros a la fecha de la consulta. La consulta debe
mostrar los montos en colones y en d�lares,

Falta: precio en libros, definir ValorResidual, columnas con costo en dolares, filtro por sede de activo
*/

CREATE PROCEDURE SP_getActivosEmpleado @CodigoSede INT, @TipoDeCambio FLOAT
AS
	SELECT E.CodEmpleado, E.Nombre, COUNT(A.CodActivo) AS CantidadAsignados, 
			SUM(A.PrecioCompra) AS CostoInicial,					  AVG(A.PrecioCompra) AS PromedioInicial,
			SUM(A.PrecioCompra)*@TipoDeCambio AS CostoInicialDolares, AVG(A.PrecioCompra)*@TipoDeCambio AS PromedioInicialDolares,
			SUM(A.ValorResidual) AS CostoResidual,					  AVG(A.PrecioCompra) AS PromedioResidual
	FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado
	WHERE A.Estado = 'A' AND A.CodSede = @CodigoSede
	GROUP BY E.CodEmpleado, E.Nombre
GO


/*
Detalle de activos asignados en la sede para un rango de a�os en particular, para este
rango debe tomar en cuenta la fecha de compra del activo y los a�os de vida �til

c�digo del activo, nombre del activo, valor inicial del activo, valor residual, categor�a,
fecha de compra, a�os de vida �til, empleado que lo tiene asignado. Este reporte se
puede hacer para todos los activos que cumplan con el rango establecido en los
par�metros o para los activos que cumplan con el rango y que pertenezcan a una
categor�a espec�fica.

Maybe make the if/else outside of SP
*/
CREATE PROCEDURE SP_ActivosEnRango @FechaInicio DATE, @FechaFinal DATE, @Categoria VARCHAR(50)
AS
	IF @Categoria IS NULL
		SELECT  CodActivo, Nombre, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AnosVidautil, CodEmpleado
		FROM ACTIVOS
		WHERE Estado = 'A'
	ELSE
		SELECT  CodActivo, Nombre, PrecioCompra, ValorResidual, Categoria, FechaCompra, VidaUtil/365 AS AnosVidautil, CodEmpleado
		FROM ACTIVOS
		WHERE Estado = 'A' AND Categoria = @Categoria
	
GO



/*
Monto total de los activos asignados a todas las sedes

cantidad de activos asignados, el monto total de los activos seg�n
el costo inicial, el monto total de los activos seg�n el valor residual y el monto total de los
activos seg�n el valor en libros a la fecha de la consulta. La consulta debe mostrar los montos
en colones y en d�lares,
*/



/*
Detalle de activos asignados en todas las sedes para un rango de a�os en particular, para este
rango debe tomar en cuenta la fecha de compra del activo y los a�os de vida �til, la
informaci�n que se debe mostrar para cada activo que se encuentre en el rango indicado es:
c�digo del activo, nombre del activo, valor inicial del activo, valor residual, categor�a, fecha
de compra, a�os de vida �til, empleado que lo tiene asignado. Este reporte se puede hacer
para todos los activos que cumplan con el rango establecido en los par�metros o para los
activos que cumplan con el rango y que pertenezcan a una categor�a espec�fica.
*/


/*

Listado de los 3 empleados que tienen mayor cantidad de activos asignados a la fecha. Se
debe mostrar la informaci�n de cada empleado, la cantidad de activos asignados por
empleado y el detalle de los activos asignados.

*/


/*

Listado de los 3 empleados cuya suma del valor en libros de los activos asignados es mayor
Se debe mostrar la informaci�n de cada empleado y la de los activos asignados.

*/
