USE AdvancedInc
GO

/* Compara los datos de login con los de la base de datos

@UserName		'Username'
@UserPassword	'Contraseña'
*/
EXEC SP_SearchUser @UserName = 'user', @UserPassword = '1234'
GO

/* Todos los activos (de usa sola sede) que estan asignados

@CodigoSede		INT 
@TipoDeCambio	FLOAT
*/
EXEC SP_getActivos @TipoDeCambio = 604.1, @CodigoSede = 2
GO

/* Todos los activos (de todas las sedes) que estan asignados

@CodigoSede		INT 
@TipoDeCambio	FLOAT
*/
EXEC SP_getActivosPorSede @TipoDeCambio = 604.1
GO

/* Todos los activos (de usa sola sede) que estan asignados entre @FechaInicio y @FechaFinal y pertenecen a @Categoria

@CodigoSede		INT 
@FechaInicio	'YYYY/MM/DD'
@FechaFinal		'YYYY/MM/DD'
@Categoria		'Categoria' o NULL: 'Ninguna' o 'None'
*/
EXEC SP_ActivosEnRango @CodigoSede = 3, @FechaInicio='2017/02/14', @FechaFinal = '2020/02/14', @Categoria = 'Utilidades'
GO

/* Todos los activos (de todas las sedes) que estan asignados entre @FechaInicio y @FechaFinal y pertenecen a @Categoria

@FechaInicio	'YYYY/MM/DD'
@FechaFinal		'YYYY/MM/DD'
@Categoria		'Categoria' o NULL: 'Ninguna' o 'None'
*/
EXEC SP_ActivosEnRangoPorSede @FechaInicio='2017/02/14', @FechaFinal = '2020/02/14', @Categoria = 'Utilidades'
GO

/* Todos los activos (de un solo empleado) que estan asignados

@CodigoEmpleado		INT 
@TipoDeCambio		FLOAT
*/
EXEC SP_getActivosEmpleado @CodigoEmpleado = 10, @TipoDeCambio = 604.1
GO


/* Calcula los 3 empleados con más activos y luego obtiene la infromación de esos activos

*/
EXEC SP_Top3EmpleadoConMasActivos
GO

/* Calcula los 3 empleados con más valor en libros de activos asignados y luego obtiene la infromación de esos activos

*/
EXEC SP_Top3EmpleadoConMasValor
GO