var express = require('express');
var port = process.env.PORT || 8080;
var app = express();
var User = require('./api/models/userModel'); //created model loading here

app.get('/', function (req, res) {
   
    var sql = require("mssql/msnodesqlv8");

    var usersRoutes = require('./api/routes/userRoutes'); //importing route
    usersRoutes(app); //register the route

    var config = {    
        driver: 'msnodesqlv8',
        connectionString:'Driver={SQL Server Native Client 11.0};Server={localhost\\SQLExpress};Database={AdvancedInc};Trusted_Connection={yes};'
    };

    // connect to your database
    sql.connect(config, function (err) {
    
        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();
           
        // query to the database and get the records
        // request.query('select * from usuarios', function (err, recordset) {
        request.query('SELECT * FROM [FROSTRITE-LAPTO].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
        // request.query('SELECT * FROM [DESKTOP-34N0LII].[AdvancedInc].[dbo].[USUARIOS]', function (err, recordset) {
            
            if (err) console.log(err)

            // send records as a response
            res.send(recordset);
            
        });
    });
});

var server = app.listen(port, function () {
    console.log('BDA1 API server started on: ' + port);
});