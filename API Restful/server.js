var express = require('express');
var app = express();

app.get('/', function (req, res) {
   
    var sql = require("mssql/msnodesqlv8");


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
        request.query('select * from usuarios', function (err, recordset) {
            
            if (err) console.log(err)

            // send records as a response
            res.send(recordset);
            
        });
    });
});

var server = app.listen(8080, function () {
    console.log('Server is running..');
});