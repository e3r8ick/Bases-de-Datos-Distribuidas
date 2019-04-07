var express = require('express');
var bodyParser = require("body-parser");
var port = process.env.PORT || 8081;
var app = express();
var sql = require("mssql/msnodesqlv8");
var http = require('https');

var date = new Date();
var d = date.getDay();
var y = date.getFullYear();
var m = date.getMonth();

var compra = 0;
var venta = 0;

var config = {
    driver: 'msnodesqlv8',
    connectionString: 'Driver={SQL Server Native Client 11.0};Server={localhost\\SQLExpress};Database={AdvancedInc};Trusted_Connection={yes};'
};

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

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

app.post('/user/:_name', function (req, res) {
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

app.post("/user", function (req, res) {
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

app.post("/employee", function (req, res) {
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

app.put("/employee", function (req, res) {
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

app.delete("/employee", function (req, res) {
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

//*** SEDES ***********************************************************************************************************************************************/
app.get('/venue', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchAllVenues', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.get('/venue/:_id', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchVenue @VenueCode = \'' + req.params._id + '\'', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.post("/venue", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spCreateVenue @VenueName = \'' + req.body.name + '\', @VenueDescription = \'' + req.body.description + '\', @VenueProvincia = \'' + req.body.provincia + '\', @VenueCanton = \'' + req.body.canton + '\', @VenueDistrito = \'' + req.body.distrito + '\', @VenueUbicationDetail = \'' + req.body.ubication + '\', @VenueStatus = \'' + req.body.status + '\', @VenueCodEmpleado = \'' + req.body.codEmpleado + '\', @VenueAdminDate = \'' + req.body.adminDate + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Sede NO insertada: ' + err);
            } else {
                res.json('Sede insertada');
            }
            sql.close();
        });
    });
});

app.put("/venue", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spUpdateVenue @VenueCode = \'' + req.body.codVenue + '\', @VenueName = \'' + req.body.name + '\', @VenueDescription = \'' + req.body.description + '\', @VenueProvincia = \'' + req.body.provincia + '\', @VenueCanton = \'' + req.body.canton + '\', @VenueDistrito = \'' + req.body.distrito + '\', @VenueUbicationDetail = \'' + req.body.ubication + '\', @VenueStatus = \'' + req.body.status + '\', @VenueCodEmpleado = \'' + req.body.codEmpleado + '\', @VenueAdminDate = \'' + req.body.adminDate + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Sede NO actualizada: ' + err);
            } else {
                res.json('Sede actualizada');
            }
            sql.close();
        });
    });
});

app.delete("/venue", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spDeleteVenue @VenueCode = \'' + req.body.codVenue + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Sede NO se elimino: ' + err);
            } else {
                res.json('Sede eliminada');
            }
            sql.close();
        });
    });
});
//*********************************************************************************************************************************************************/

//*** ACTIVOS *********************************************************************************************************************************************/
app.get('/asset', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchAllAssets', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.get('/asset/:_id', function (req, res) {
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spSearchAsset @AssetCode = \'' + req.params._id + '\'', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.json(recordset.recordset);
            sql.close();
        });
    });
});

app.post("/asset", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spCreateAsset @AssetName = \'' + req.body.name + '\', @AssetDescription = \'' + req.body.description + '\', @AssetCategory = \'' + req.body.category + '\', @AssetPhoto = \'' + req.body.photo + '\', @AssetPrice = \'' + req.body.price + '\', @AssetLifeSpan = \'' + req.body.lifeSpan + '\', @AssetPjeDepreciacion = \'' + req.body.pjeDepreciacion + '\', @AssetBuyingDate = \'' + req.body.buyingDate + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetWarrantyDate = \'' + req.body.warrantyDate + '\', @AssetValorResidual = \'' + req.body.valorResidual + '\', @AssetCentroCosto = \'' + req.body.centroCosto + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\', @AssetStatus = \'' + req.body.status + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Activo NO insertado: ' + err);
            } else {
                res.json('Activo insertado');
            }
            sql.close();
        });
    });
});

app.post("/asset", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spUpdateAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetName = \'' + req.body.name + '\', @AssetDescription = \'' + req.body.description + '\', @AssetCategory = \'' + req.body.category + '\', @AssetPhoto = \'' + req.body.photo + '\', @AssetPrice = \'' + req.body.price + '\', @AssetLifeSpan = \'' + req.body.lifeSpan + '\', @AssetPjeDepreciacion = \'' + req.body.pjeDepreciacion + '\', @AssetBuyingDate = \'' + req.body.buyingDate + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetWarrantyDate = \'' + req.body.warrantyDate + '\', @AssetValorResidual = \'' + req.body.valorResidual + '\', @AssetCentroCosto = \'' + req.body.centroCosto + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\', @AssetStatus = \'' + req.body.status + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Activo NO actualizado: ' + err);
            } else {
                res.json('Activo actualizado');
            }
            sql.close();
        });
    });
});

app.delete("/asset", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spDeleteAsset @AssetCode = \'' + req.body.codAsset + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Activo NO se elimino: ' + err);
            } else {
                res.json('Activo eliminado');
            }
            sql.close();
        });
    });
});

app.post("/asset/assign", function (req, res) {
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXECUTE spAssignAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\'', function (err, recordset) {
            if (err) {
                console.log(err)
                res.json('Activo NO asignado: ' + err);
            } else {
                res.json('Activo asignado');
            }
            sql.close();
        });
    });
});


//*********************************************************************************************************************************************************/

var server = app.listen(port, function () {
    console.log('BDA1 API server started on: ' + port);
});