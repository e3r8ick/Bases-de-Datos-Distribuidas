var express = require('express');
var bodyParser = require("body-parser");
var port = process.env.PORT || 8080;
var app = express();
var sql = require("mssql/msnodesqlv8");

var usersRoutes = require('./api/routes/userRoutes'); //importing route
usersRoutes(app); //register the route

var config = {    
    driver: 'msnodesqlv8',
    connectionString:'Driver={SQL Server Native Client 11.0};Server={localhost\\SQLExpress};Database={AdvancedInc};Trusted_Connection={yes};'
};

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//*** USERS ***********************************************************************************************************************************************/
app.get('/user', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchAllUsers', function (err, recordset) {
        // request.query('SELECT * FROM [FROSTRITE-LAPTO].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
        // request.query('SELECT * FROM [DESKTOP-34N0LII].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.get('/user/:_name', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchUser @UserName = \'' + req.params._name + '\', @UserPassword = \'' + req.body.password + '\'', function (err, recordset) {
        // request.query('select * from usuarios where nombre=\'' + req.params._name + '\' and contrasena=\'' + req.body.password + '\'', function (err, recordset) {
        // request.query('SELECT * FROM [FROSTRITE-LAPTO].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
        // request.query('SELECT * FROM [DESKTOP-34N0LII].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });
    });
});

app.post("/user", function(req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database
        request.query('EXECUTE spCreateUser @UserName = \'' + req.body.name + '\', @UserPassword = \'' + req.body.password + '\', @UserRol = \'' + req.body.rol + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Usuario NO insertado: ' + err);
            } else {
                res.json('Usuario insertado');
            }
            sql.close();
        });
    });
});
//*********************************************************************************************************************************************************/

//*** EMPLEADOS *******************************************************************************************************************************************/
app.get('/employee', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchAllEmployees', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.get('/employee/:_id', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchEmployee @EmployeeId = \'' + req.params._id + '\'', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.post("/employee", function(req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spCreateEmployee @EmployeeName = \'' + req.body.name + '\', @EmployeeStatus = \'' + req.body.status + '\', @EmployeePhoto = \'' + req.body.photo + '\', @EmployeeCodSede = \'' + req.body.codSede + '\', @EmployeeCodDepartamento = \'' + req.body.codDepartamento + '\', @EmployeeDate = \'' + req.body.date + '\', @EmployeeJob = \'' + req.body.job + '\', @EmployeeId = \'' + req.body.id + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Empleado NO insertado: ' + err);
            } else {
                res.json('Empleado insertado');
            }
            sql.close();
        });
    });
});

app.put("/employee", function(req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spUpdateEmployee @EmployeeName = \'' + req.body.name + '\', @EmployeeStatus = \'' + req.body.status + '\', @EmployeePhoto = \'' + req.body.photo + '\', @EmployeeCodSede = \'' + req.body.codSede + '\', @EmployeeCodDepartamento = \'' + req.body.codDepartamento + '\', @EmployeeDate = \'' + req.body.date + '\', @EmployeeJob = \'' + req.body.job + '\', @EmployeeId = \'' + req.body.id + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Empleado NO actualizado: ' + err);
            } else {
                res.json('Empleado actualizado');
            }
            sql.close();
        });
    });
});

app.delete("/employee", function(req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spDeleteEmployee @EmployeeId = \'' + req.body.id + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Empleado NO se elimino: ' + err);
            } else {
                res.json('Empleado eliminado');
            }
            sql.close();
        });
    });
});
//*********************************************************************************************************************************************************/

var server = app.listen(port, function () {
    console.log('BDA1 API server started on: ' + port);
});