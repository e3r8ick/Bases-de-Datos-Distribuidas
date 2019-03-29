/* Assigned ACTIVES to EMPLOYEE 1*/
SELECT CodActivo, A.Nombre, E.Nombre
FROM ACTIVOS AS A JOIN EMPLEADOS AS E ON A.CodEmpleado = E.CodEmpleado
WHERE E.CodEmpleado = 1 AND A.Estado = 'A'


/* Non monetary information about actives */
SELECT CodActivo, Nombre, Descripcion, Categoria, Foto, FechaRegistro, FechaGarantia
FROM ACTIVOS
WHERE Estado = 'A' OR Estado = 'G' OR Estado = 'S' 



/* Information to calculate depretiation */
SELECT CodActivo, Nombre, PrecioCompra, PjeDepreciacion, FechaCompra, CentroCosto, ValorResidual
FROM ACTIVOS
WHERE Estado = 'A' OR Estado = 'G' OR Estado = 'S' 



/* Depreciacion Lineal */
SELECT CodActivo, Nombre, PrecioCompra, PjeDepreciacion, DATEDIFF(year, FechaCompra,GETDATE()) AS AnosDepreciacion, VidaUtil/365 AS VidaUtilAnos, (PrecioCompra-(PrecioCompra*PjeDepreciacion/100* DATEDIFF(year, FechaCompra,GETDATE()))) AS PrecioActual
FROM ACTIVOS
WHERE Estado = 'A' OR Estado = 'G' OR Estado = 'S' 


SELECT CodActivo, Nombre, DATEDIFF(year, FechaCompra,GETDATE()) AS AnosDepreciacion, VidaUtil
FROM ACTIVOS
WHERE CodActivo=7



SELECT CodActivo, Nombre, FechaCompra, GETDATE() AS CurrentDate, VidaUtil/365 AS VidaUtilAnos
FROM ACTIVOS
WHERE CodActivo=7
