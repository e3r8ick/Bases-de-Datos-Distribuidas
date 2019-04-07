var express = require("express");
var bodyParser = require("body-parser");
var port = process.env.PORT || 8080;
var app = express();
var sql = require("mssql");
var http = require('https');

var date = new Date();
var d = date.getDay();
var y = date.getFullYear();
var m = date.getMonth();

var compra = 0;
var venta = 0;

// Body Parser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//CORS Middleware
app.use(function (req, res, next) {
    //Enabling CORS 
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, contentType,Content-Type, Accept, Authorization");
    next();
});

//Initiallising connection string
var dbConfig = {
    user: 'admin',
    password: '123',
    server: '192.168.1.142',
    database: 'AdvancedInc'
};

//Function to connect to database and execute query
var executeQuery = function (res1, query) {
    sql.connect(dbConfig, function (err) {
        if (err) {
            console.log("Error while connecting database :- " + err);
            res1.send(err);
        }
        else {
            // create Request object
            var request = new sql.Request();
            // query to the database
            request.query(query, function (err, res) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res1.send(err);
                }
                else {
                    res1.send(res.recordset);
                }
                sql.close();
            });
        }
    });
}

//*** TIPO CAMBIO *****************************************************************************************************************************************/

var options = {
    hostname: 'gee.bccr.fi.cr',
    path: '/indicadoreseconomicos/WebServices/wsIndicadoresEconomicos.asmx/ObtenerIndicadoresEconomicos?tcIndicador=317&tcFechaInicio=' + d + '/' + (m + 1) + '/' + y + '&tcFechaFinal=' + d + '/' + (m + 1) + '/' + y + '&tcNombre=B&tnSubNiveles=n'
};

http.get(options, function (response) {
    var completeResponse = '';
    response.on('data', function (chunk) {
        completeResponse += chunk;
    });
    response.on('end', function () {
        var xml2js = require('xml2js');
        var parser = new xml2js.Parser();
        parser.parseString(completeResponse, function (err, result) {
            compra = result['DataSet']['diffgr:diffgram'][0]['Datos_de_INGC011_CAT_INDICADORECONOMIC'][0]['INGC011_CAT_INDICADORECONOMIC'][0]['NUM_VALOR'];
        });

    })
}).on('error', function (e) {
    console.log('problem with request: ' + e.message);
});


var options = {
    hostname: 'gee.bccr.fi.cr',
    path: '/indicadoreseconomicos/WebServices/wsIndicadoresEconomicos.asmx/ObtenerIndicadoresEconomicos?tcIndicador=318&tcFechaInicio=' + d + '/' + (m + 1) + '/' + y + '&tcFechaFinal=' + d + '/' + (m + 1) + '/' + y + '&tcNombre=B&tnSubNiveles=n'
};

http.get(options, function (response) {
    var completeResponse = '';
    response.on('data', function (chunk) {
        completeResponse += chunk;
    });
    response.on('end', function () {
        var xml2js = require('xml2js');
        var parser = new xml2js.Parser();
        parser.parseString(completeResponse, function (err, result) {
            venta = result['DataSet']['diffgr:diffgram'][0]['Datos_de_INGC011_CAT_INDICADORECONOMIC'][0]['INGC011_CAT_INDICADORECONOMIC'][0]['NUM_VALOR'];
        });

    })
}).on('error', function (e) {
    console.log('problem with request: ' + e.message);
});

app.get('/tipo', function (req, res) {
    var options = {
        hostname: 'gee.bccr.fi.cr',
        path: '/indicadoreseconomicos/WebServices/wsIndicadoresEconomicos.asmx/ObtenerIndicadoresEconomicos?tcIndicador=317&tcFechaInicio=' + d + '/' + (m + 1) + '/' + y + '&tcFechaFinal=' + d + '/' + (m + 1) + '/' + y + '&tcNombre=B&tnSubNiveles=n'
    };

    http.get(options, function (response) {
        var completeResponse = '';
        response.on('data', function (chunk) {
            completeResponse += chunk;
        });
        response.on('end', function () {
            var xml2js = require('xml2js');
            var parser = new xml2js.Parser();
            parser.parseString(completeResponse, function (err, result) {
                compra = result['DataSet']['diffgr:diffgram'][0]['Datos_de_INGC011_CAT_INDICADORECONOMIC'][0]['INGC011_CAT_INDICADORECONOMIC'][0]['NUM_VALOR'];
            });

        })
    }).on('error', function (e) {
        console.log('problem with request: ' + e.message);
    });


    var options = {
        hostname: 'gee.bccr.fi.cr',
        path: '/indicadoreseconomicos/WebServices/wsIndicadoresEconomicos.asmx/ObtenerIndicadoresEconomicos?tcIndicador=318&tcFechaInicio=' + d + '/' + (m + 1) + '/' + y + '&tcFechaFinal=' + d + '/' + (m + 1) + '/' + y + '&tcNombre=B&tnSubNiveles=n'
    };

    http.get(options, function (response) {
        var completeResponse = '';
        response.on('data', function (chunk) {
            completeResponse += chunk;
        });
        response.on('end', function () {
            var xml2js = require('xml2js');
            var parser = new xml2js.Parser();
            parser.parseString(completeResponse, function (err, result) {
                venta = result['DataSet']['diffgr:diffgram'][0]['Datos_de_INGC011_CAT_INDICADORECONOMIC'][0]['INGC011_CAT_INDICADORECONOMIC'][0]['NUM_VALOR'];
            });

        })
    }).on('error', function (e) {
        console.log('problem with request: ' + e.message);
    });

    res.send('Compra: ' + compra + '\nVenta: ' + venta);
});

app.get('/tipo/compra', function (req, res) {
    var options = {
        hostname: 'gee.bccr.fi.cr',
        path: '/indicadoreseconomicos/WebServices/wsIndicadoresEconomicos.asmx/ObtenerIndicadoresEconomicos?tcIndicador=317&tcFechaInicio=' + d + '/' + (m + 1) + '/' + y + '&tcFechaFinal=' + d + '/' + (m + 1) + '/' + y + '&tcNombre=B&tnSubNiveles=n'
    };

    http.get(options, function (response) {
        var completeResponse = '';
        response.on('data', function (chunk) {
            completeResponse += chunk;
        });
        response.on('end', function () {
            var xml2js = require('xml2js');
            var parser = new xml2js.Parser();
            parser.parseString(completeResponse, function (err, result) {
                compra = result['DataSet']['diffgr:diffgram'][0]['Datos_de_INGC011_CAT_INDICADORECONOMIC'][0]['INGC011_CAT_INDICADORECONOMIC'][0]['NUM_VALOR'];
                res.send('Compra: ' + compra);
            });

        })
    }).on('error', function (e) {
        console.log('problem with request: ' + e.message);
    });

});

app.get('/tipo/venta', function (req, res) {
    var options = {
        hostname: 'gee.bccr.fi.cr',
        path: '/indicadoreseconomicos/WebServices/wsIndicadoresEconomicos.asmx/ObtenerIndicadoresEconomicos?tcIndicador=318&tcFechaInicio=' + d + '/' + (m + 1) + '/' + y + '&tcFechaFinal=' + d + '/' + (m + 1) + '/' + y + '&tcNombre=B&tnSubNiveles=n'
    };

    http.get(options, function (response) {
        var completeResponse = '';
        response.on('data', function (chunk) {
            completeResponse += chunk;
        });
        response.on('end', function () {
            var xml2js = require('xml2js');
            var parser = new xml2js.Parser();
            parser.parseString(completeResponse, function (err, result) {
                venta = result['DataSet']['diffgr:diffgram'][0]['Datos_de_INGC011_CAT_INDICADORECONOMIC'][0]['INGC011_CAT_INDICADORECONOMIC'][0]['NUM_VALOR'];
                res.send('Venta: ' + venta);
            });

        })
    }).on('error', function (e) {
        console.log('problem with request: ' + e.message);
    });

});
//*********************************************************************************************************************************************************/

//*** USERS ***********************************************************************************************************************************************/
app.get('/user', function (req, res) {
    var query = 'EXECUTE spSearchAllUsers';
    executeQuery(res, query);
});

app.post('/user/:_name', function (req, res) {
    var query = 'EXECUTE spSearchUser @UserName = \'' + req.params._name + '\', @UserPassword = \'' + req.body.password + '\'';
    executeQuery(res, query);
});

app.post("/user", function (req, res) {
    var query = 'EXECUTE spCreateUser @UserName = \'' + req.body.name + '\', @UserPassword = \'' + req.body.password + '\', @UserRol = \'' + req.body.rol + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** EMPLEADOS *******************************************************************************************************************************************/
app.get('/employee', function (req, res) {
    var query = 'EXECUTE spSearchAllEmployees';
    executeQuery(res, query);
});

app.get('/employee/:_id', function (req, res) {
    var query = 'EXECUTE spSearchEmployee @EmployeeId = \'' + req.params._id + '\'';
    executeQuery(res, query);
});

app.post("/employee", function (req, res) {
    var query = 'EXECUTE spCreateEmployee @EmployeeName = \'' + req.body.name + '\', @EmployeeStatus = \'' + req.body.status + '\', @EmployeePhoto = \'' + req.body.photo + '\', @EmployeeCodSede = \'' + req.body.codSede + '\', @EmployeeCodDepartamento = \'' + req.body.codDepartamento + '\', @EmployeeDate = \'' + req.body.date + '\', @EmployeeJob = \'' + req.body.job + '\', @EmployeeId = \'' + req.body.id + '\'';
    executeQuery(res, query);
});

app.put("/employee", function (req, res) {
    var query = 'EXECUTE spUpdateEmployee @EmployeeName = \'' + req.body.name + '\', @EmployeeStatus = \'' + req.body.status + '\', @EmployeePhoto = \'' + req.body.photo + '\', @EmployeeCodSede = \'' + req.body.codSede + '\', @EmployeeCodDepartamento = \'' + req.body.codDepartamento + '\', @EmployeeDate = \'' + req.body.date + '\', @EmployeeJob = \'' + req.body.job + '\', @EmployeeId = \'' + req.body.id + '\'';
    executeQuery(res, query);
});

app.delete("/employee", function (req, res) {
    var query = 'EXECUTE spDeleteEmployee @EmployeeId = \'' + req.body.id + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** SEDES ***********************************************************************************************************************************************/
app.get('/venue', function (req, res) {
    var query = 'EXECUTE spSearchAllVenues';
    executeQuery(res, query);
});

app.get('/venue/:_id', function (req, res) {
    var query = 'EXECUTE spSearchVenue @VenueCode = \'' + req.params._id + '\'';
    executeQuery(res, query);
});

app.post("/venue", function (req, res) {
    var query = 'EXECUTE spCreateVenue @VenueName = \'' + req.body.name + '\', @VenueDescription = \'' + req.body.description + '\', @VenueProvincia = \'' + req.body.provincia + '\', @VenueCanton = \'' + req.body.canton + '\', @VenueDistrito = \'' + req.body.distrito + '\', @VenueUbicationDetail = \'' + req.body.ubication + '\', @VenueStatus = \'' + req.body.status + '\', @VenueCodEmpleado = \'' + req.body.codEmpleado + '\', @VenueAdminDate = \'' + req.body.adminDate + '\'';
    executeQuery(res, query);
});

app.put("/venue", function (req, res) {
    var query = 'EXECUTE spUpdateVenue @VenueCode = \'' + req.body.codVenue + '\', @VenueName = \'' + req.body.name + '\', @VenueDescription = \'' + req.body.description + '\', @VenueProvincia = \'' + req.body.provincia + '\', @VenueCanton = \'' + req.body.canton + '\', @VenueDistrito = \'' + req.body.distrito + '\', @VenueUbicationDetail = \'' + req.body.ubication + '\', @VenueStatus = \'' + req.body.status + '\', @VenueCodEmpleado = \'' + req.body.codEmpleado + '\', @VenueAdminDate = \'' + req.body.adminDate + '\'';
    executeQuery(res, query);
});

app.delete("/venue", function (req, res) {
    var query = 'EXECUTE spDeleteVenue @VenueCode = \'' + req.body.codVenue + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** ACTIVOS *********************************************************************************************************************************************/
app.get('/asset', function (req, res) {
    var query = 'EXECUTE spSearchAllAssets';
    executeQuery(res, query);
});

app.get('/asset/:_id', function (req, res) {
    var query = 'EXECUTE spSearchAsset @AssetCode = \'' + req.params._id + '\'';
    executeQuery(res, query);
});

app.post("/asset", function (req, res) {
    var query = 'EXECUTE spCreateAsset @AssetName = \'' + req.body.name + '\', @AssetDescription = \'' + req.body.description + '\', @AssetCategory = \'' + req.body.category + '\', @AssetPhoto = \'' + req.body.photo + '\', @AssetPrice = \'' + req.body.price + '\', @AssetLifeSpan = \'' + req.body.lifeSpan + '\', @AssetPjeDepreciacion = \'' + req.body.pjeDepreciacion + '\', @AssetBuyingDate = \'' + req.body.buyingDate + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetWarrantyDate = \'' + req.body.warrantyDate + '\', @AssetValorResidual = \'' + req.body.valorResidual + '\', @AssetCentroCosto = \'' + req.body.centroCosto + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\', @AssetStatus = \'' + req.body.status + '\'';
    executeQuery(res, query);
});

app.put("/asset", function (req, res) {
    var query = 'EXECUTE spUpdateAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetName = \'' + req.body.name + '\', @AssetDescription = \'' + req.body.description + '\', @AssetCategory = \'' + req.body.category + '\', @AssetPhoto = \'' + req.body.photo + '\', @AssetPrice = \'' + req.body.price + '\', @AssetLifeSpan = \'' + req.body.lifeSpan + '\', @AssetPjeDepreciacion = \'' + req.body.pjeDepreciacion + '\', @AssetBuyingDate = \'' + req.body.buyingDate + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetWarrantyDate = \'' + req.body.warrantyDate + '\', @AssetValorResidual = \'' + req.body.valorResidual + '\', @AssetCentroCosto = \'' + req.body.centroCosto + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\', @AssetStatus = \'' + req.body.status + '\'';
    executeQuery(res, query);
});

app.delete("/asset", function (req, res) {
    var query = 'EXECUTE spDeleteAsset @AssetCode = \'' + req.body.codAsset + '\'';
    executeQuery(res, query);
});

app.put("/asset/assign", function (req, res) {
    var query = 'EXECUTE spAssignAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//Setting up server
var server = app.listen(port, function () {
    console.log('BDA1 API server started on: ' + port);
});