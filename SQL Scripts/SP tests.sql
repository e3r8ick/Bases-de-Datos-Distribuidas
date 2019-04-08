USE AdvancedInc
GO

/* Compara los datos de login con los de la base de datos

@UserName		'Username'
@UserPassword	'Contraseña'
*/
EXEC spSearchUser @UserName = 'user', @UserPassword = '1234'
GO

/* Todos los activos (de usa sola sede) que estan asignados

@CodigoSede		INT 
@TipoDeCambio	FLOAT
*/
EXEC spGetActivos @TipoDeCambio = 604.1, @CodigoSede = 2
GO

/* Todos los activos (de todas las sedes) que estan asignados

@CodigoSede		INT 
@TipoDeCambio	FLOAT
*/
EXEC spGetActivosPorSede @TipoDeCambio = 604.1
GO

/* Todos los activos (de usa sola sede) que estan asignados entre @FechaInicio y @FechaFinal y pertenecen a @Categoria

@CodigoSede		INT 
@FechaInicio	'YYYY/MM/DD'
@FechaFinal		'YYYY/MM/DD'
@Categoria		'Categoria' o NULL: 'Ninguna' o 'None'
*/
EXEC spActivosEnRango @CodigoSede = 3, @FechaInicio='2017/02/14', @FechaFinal = '2020/02/14', @Categoria = 'Utilidades'
GO

/* Todos los activos (de todas las sedes) que estan asignados entre @FechaInicio y @FechaFinal y pertenecen a @Categoria

@FechaInicio	'YYYY/MM/DD'
@FechaFinal		'YYYY/MM/DD'
@Categoria		'Categoria' o NULL: 'Ninguna' o 'None'
*/
EXEC spActivosEnRangoPorSede @FechaInicio='2017/02/14', @FechaFinal = '2020/02/14', @Categoria = 'Utilidades'
GO

/* Todos los activos (de un solo empleado) que estan asignados

@CodigoEmpleado		INT 
@TipoDeCambio		FLOAT
*/
EXEC spGetActivosEmpleado @CodigoEmpleado = 10, @TipoDeCambio = 604.1
GO


/* Calcula los 3 empleados con más activos y luego obtiene la infromación de esos activos

*/
EXEC spTop3EmpleadoConMasActivos
GO

/* Calcula los 3 empleados con más valor en libros de activos asignados y luego obtiene la infromación de esos activos

*/
EXEC spTop3EmpleadoConMasValor
GO