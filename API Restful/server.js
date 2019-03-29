var express = require('express');
var bodyParser = require("body-parser");
var port = process.env.PORT || 8080;
var app = express();
var User = require('./api/models/userModel'); //created model loading here
var sql = require("mssql/msnodesqlv8");

var usersRoutes = require('./api/routes/userRoutes'); //importing route
usersRoutes(app); //register the route

var config = {    
    driver: 'msnodesqlv8',
    connectionString:'Driver={SQL Server Native Client 11.0};Server={localhost\\SQLExpress};Database={AdvancedInc};Trusted_Connection={yes};'
};

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/user', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from usuarios', function (err, recordset) {
        // request.query('SELECT * FROM [FROSTRITE-LAPTO].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
        // request.query('SELECT * FROM [DESKTOP-34N0LII].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.post('/user/:_name', function (req, res) {
    // res.json(req.params._name);
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
    // res.send(req.body.password);
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('insert into usuarios (Nombre, Contrasena, Roll) values (\''+req.body.name+'\', \''+req.body.password+'\', \''+req.body.rol+'\')', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json('Usuario insertado');
            sql.close();
        });
    });
});

app.get('/employee', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from empleados', function (err, recordset) {
        // request.query('SELECT * FROM [FROSTRITE-LAPTO].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
        // request.query('SELECT * FROM [DESKTOP-34N0LII].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.post("/user", function(req, res) {
    // res.send(req.body.password);
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('insert into empleados (Nombre, Estado, Fotografia, CodSede, CodDepartamento, FechaIngreso, Puesto, Cedula) values (\''+req.body.name+'\', \''+req.body.status+'\', \''+req.body.photo+'\', \''+req.body.codSede+'\', \''+req.body.codDepartamento+'\', \''+req.body.date+'\', \''+req.body.job+'\', \''+req.body.id+'\')', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json('Usuario insertado');
            sql.close();
        });
    });
});

var server = app.listen(port, function () {
    console.log('BDA1 API server started on: ' + port);
});