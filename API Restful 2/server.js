var express = require("express");
var bodyParser = require("body-parser");
var port = process.env.PORT || 8080;
var app = express();
var sql = require("mssql");
var http = require('https');

var date = new Date();
var d = date.getDate();
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
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,post");
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
//Function to connect to the BCCR and get the currency exchange rate
var getCompra = function () {
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
}

//Function to connect to the BCCR and get the currency exchange rate
var getVenta = function () {
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
}

getVenta();
getCompra();

//Function to get the currency exchange rate 
app.get('/tipo', function (req, res) {
    getVenta();
    getCompra();

    var exchangeRate = {} // empty Object
    var key = 'Tipo de cambio';
    exchangeRate[key] = []; // empty Array, which you can push() values into

    var data = {
        Venta: '' + venta + '',
        Compra: '' + compra + ''
    };
    exchangeRate[key].push(data);

    res.send(exchangeRate);
});

//Function to obtain currency sale exhange rate
app.get('/tipo/compra', function (req, res) {
    getCompra();

    var exchangeRate = {} // empty Object
    var key = 'Tipo de cambio';
    exchangeRate[key] = []; // empty Array, which you can push() values into

    var data = {
        Compra: '' + compra + ''
    };
    exchangeRate[key].push(data);

    res.send(exchangeRate);
});

//Function to obtain currency purchase exhange rate
app.get('/tipo/venta', function (req, res) {
    getVenta();
    var exchangeRate = {} // empty Object
    var key = 'Tipo de cambio';
    exchangeRate[key] = []; // empty Array, which you can push() values into

    var data = {
        Venta: '' + venta + '',
    };
    exchangeRate[key].push(data);

    res.send(exchangeRate);
});
//*********************************************************************************************************************************************************/

//*** USERS ***********************************************************************************************************************************************/
//Function to get the information from all users
app.get('/user', function (req, res) {
    var query = 'EXECUTE spSearchAllUsers';
    executeQuery(res, query);
});

//Function to get the rol about from a specific user using the password (login)
app.post('/user/:_name', function (req, res) {
    var query = 'EXECUTE spSearchUser @UserName = \'' + req.params._name + '\', @UserPassword = \'' + req.body.password + '\'';
    executeQuery(res, query);
});

//Function to create a new user
app.post("/user", function (req, res) {
    var query = 'EXECUTE spCreateUser @UserName = \'' + req.body.name + '\', @UserPassword = \'' + req.body.password + '\', @UserRol = \'' + req.body.rol + '\'';
    executeQuery(res, query);
});

//Function to delete a specific user using the password
app.post("/user/delete/:_name", function (req, res) {
    var query = 'EXECUTE spDeleteUser @UserName = \'' + req.params._name + '\', @UserPassword = \'' + req.body.password + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** EMPLEADOS *******************************************************************************************************************************************/
//Function to get the information from all employees
app.get('/employee', function (req, res) {
    var query = 'EXECUTE spSearchAllEmployees';
    executeQuery(res, query);
});

//Function to get the information from a specific employee using the personal identification number
app.get('/employee/:_id', function (req, res) {
    var query = 'EXECUTE spSearchEmployee @EmployeeId = \'' + req.params._id + '\'';
    executeQuery(res, query);
});

//Function to create a new employee
app.post("/employee", function (req, res) {
    var query = 'EXECUTE spCreateEmployee @EmployeeName = \'' + req.body.name + '\', @EmployeeStatus = \'' + req.body.status + '\', @EmployeePhoto = \'' + req.body.photo + '\', @EmployeeCodSede = \'' + req.body.codSede + '\', @EmployeeCodDepartamento = \'' + req.body.codDepartamento + '\', @EmployeeDate = \'' + req.body.date + '\', @EmployeeJob = \'' + req.body.job + '\', @EmployeeId = \'' + req.body.id + '\'';
    executeQuery(res, query);
});

//Function to update a employee
app.post("/employee/update", function (req, res) {
    var query = 'EXECUTE spUpdateEmployee @EmployeeName = \'' + req.body.name + '\', @EmployeeStatus = \'' + req.body.status + '\', @EmployeePhoto = \'' + req.body.photo + '\', @EmployeeCodSede = \'' + req.body.codSede + '\', @EmployeeCodDepartamento = \'' + req.body.codDepartamento + '\', @EmployeeDate = \'' + req.body.date + '\', @EmployeeJob = \'' + req.body.job + '\', @EmployeeId = \'' + req.body.id + '\'';
    executeQuery(res, query);
});

//Function to delete a employee using the id
app.post("/employee/delete", function (req, res) {
    var query = 'EXECUTE spDeleteEmployee @EmployeeId = \'' + req.body.id + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** SEDES ***********************************************************************************************************************************************/
//Function to get the information from all venues
app.get('/venue', function (req, res) {
    var query = 'EXECUTE spSearchAllVenues';
    executeQuery(res, query);
});

//Function to get the information from a specific venue using the venue id
app.get('/venue/:_id', function (req, res) {
    var query = 'EXECUTE spSearchVenue @VenueCode = \'' + req.params._id + '\'';
    executeQuery(res, query);
});

//Function to create a new venue
app.post("/venue", function (req, res) {
    var query = 'EXECUTE spCreateVenue @VenueName = \'' + req.body.name + '\', @VenueDescription = \'' + req.body.description + '\', @VenueProvincia = \'' + req.body.provincia + '\', @VenueCanton = \'' + req.body.canton + '\', @VenueDistrito = \'' + req.body.distrito + '\', @VenueUbicationDetail = \'' + req.body.ubication + '\', @VenueStatus = \'' + req.body.status + '\', @VenueCodEmpleado = \'' + req.body.codEmpleado + '\', @VenueAdminDate = \'' + req.body.adminDate + '\'';
    executeQuery(res, query);
});

//Function to update a venue
app.post("/venue/update", function (req, res) {
    var query = 'EXECUTE spUpdateVenue @VenueCode = \'' + req.body.codVenue + '\', @VenueName = \'' + req.body.name + '\', @VenueDescription = \'' + req.body.description + '\', @VenueProvincia = \'' + req.body.provincia + '\', @VenueCanton = \'' + req.body.canton + '\', @VenueDistrito = \'' + req.body.distrito + '\', @VenueUbicationDetail = \'' + req.body.ubication + '\', @VenueStatus = \'' + req.body.status + '\', @VenueCodEmpleado = \'' + req.body.codEmpleado + '\', @VenueAdminDate = \'' + req.body.adminDate + '\'';
    executeQuery(res, query);
});

//Function to delete a venue using the venue id
app.post("/venue/delete", function (req, res) {
    var query = 'EXECUTE spDeleteVenue @VenueCode = \'' + req.body.codVenue + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** ACTIVOS *********************************************************************************************************************************************/
//Function to get the information from all assets
app.get('/asset', function (req, res) {
    var query = 'EXECUTE spSearchAllAssets';
    executeQuery(res, query);
});

//Function to get the information from a specific asset using the asset id
app.get('/asset/:_id', function (req, res) {
    var query = 'EXECUTE spSearchAsset @AssetCode = \'' + req.params._id + '\'';
    executeQuery(res, query);
});

//Function to create a new asset
app.post("/asset", function (req, res) {
    var query = 'EXECUTE spCreateAsset @AssetName = \'' + req.body.name + '\', @AssetDescription = \'' + req.body.description + '\', @AssetCategory = \'' + req.body.category + '\', @AssetPhoto = \'' + req.body.photo + '\', @AssetPrice = \'' + req.body.price + '\', @AssetLifeSpan = \'' + req.body.lifeSpan + '\', @AssetPjeDepreciacion = \'' + req.body.pjeDepreciacion + '\', @AssetBuyingDate = \'' + req.body.buyingDate + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetWarrantyDate = \'' + req.body.warrantyDate + '\', @AssetValorResidual = \'' + req.body.valorResidual + '\', @AssetCentroCosto = \'' + req.body.centroCosto + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\', @AssetStatus = \'' + req.body.status + '\'';
    executeQuery(res, query);
});

//Function to update a asset information
app.post("/asset/update", function (req, res) {
    var query = 'EXECUTE spUpdateAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetName = \'' + req.body.name + '\', @AssetDescription = \'' + req.body.description + '\', @AssetCategory = \'' + req.body.category + '\', @AssetPhoto = \'' + req.body.photo + '\', @AssetPrice = \'' + req.body.price + '\', @AssetLifeSpan = \'' + req.body.lifeSpan + '\', @AssetPjeDepreciacion = \'' + req.body.pjeDepreciacion + '\', @AssetBuyingDate = \'' + req.body.buyingDate + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetWarrantyDate = \'' + req.body.warrantyDate + '\', @AssetValorResidual = \'' + req.body.valorResidual + '\', @AssetCentroCosto = \'' + req.body.centroCosto + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\', @AssetStatus = \'' + req.body.status + '\'';
    executeQuery(res, query);
});

//Function to delete a asset
app.post("/asset/delete", function (req, res) {
    var query = 'EXECUTE spDeleteAsset @AssetCode = \'' + req.body.codAsset + '\'';
    executeQuery(res, query);
});

//Function to assign an asset to a employee
app.post("/asset/assign", function (req, res) {
    var query = 'EXECUTE spAssignAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetRegistrationDate = \'' + req.body.registrationDate + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\', @AssetUbicationDetail = \'' + req.body.ubicationDetail + '\'';
    executeQuery(res, query);
});

//Function to update status information from a asset
app.post("/asset/status", function (req, res) {
    var query = 'EXECUTE spStatusUpdateAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetStatus = \'' + req.body.status + '\'';
    executeQuery(res, query);
});

//Function to update venue information from a asset, require employee id
app.post("/asset/venue", function (req, res) {
    var query = 'EXECUTE spVenueUpdateAsset @AssetCode = \'' + req.body.codAsset + '\', @AssetCodEmployee = \'' + req.body.codEmployee + '\', @AssetCodVenue = \'' + req.body.codVenue + '\'';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** REPORTES ADMIN **************************************************************************************************************************************/
//Function to get the report from all assets assigned to a specific venue
app.post('/report/admin/venue', function (req, res) {
    var query = 'EXECUTE spGetActivos @TipoDeCambio = \'' + venta + '\', @CodigoSede = \'' + req.body.codVenue + '\';';
    executeQuery(res, query);
});

//Function to get the report from all assets assigned to a specific employee
app.post('/report/admin/employee', function (req, res) {
    var query = 'EXECUTE spGetActivosEmpleado @TipoDeCambio = \'' + venta + '\', @CodigoEmpleado = \'' + req.body.codEmployee + '\';';
    executeQuery(res, query);
});

//Function to get the report from all assets assigned to a specific venue in a time range
app.post('/report/admin/timerange', function (req, res) {
    var query = 'EXECUTE spActivosEnRango @CodigoSede = \'' + req.body.codVenue + '\', @FechaInicio = \'' + req.body.startDate + '\', @FechaFinal = \'' + req.body.endDate + '\', @Categoria = \'' + req.body.category + '\';';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//*** REPORTES MANAGER ************************************************************************************************************************************/
//Function to get the report from all assets assigned per venue
app.post('/report/manager/venue', function (req, res) {
    var query = 'EXECUTE spGetActivosPorSede @TipoDeCambio = \'' + venta + '\';';
    executeQuery(res, query);
});

//Function to get the report from all assets assigned to every venue in a time range
app.post('/report/manager/timerange', function (req, res) {
    var query = 'EXECUTE spActivosEnRangoPorSede @FechaInicio = \'' + req.body.startDate + '\', @FechaFinal = \'' + req.body.endDate + '\', @Categoria = \'' + req.body.category + '\';';
    executeQuery(res, query);
});

//Function to get the report from top 3 employees with more assets
app.post('/report/manager/topassets', function (req, res) {
    var query = 'EXECUTE spTop3EmpleadoConMasActivos;';
    executeQuery(res, query);
});

//Function to get the report from top 3 employees with more value in assets
app.post('/report/manager/topvalue', function (req, res) {
    var query = 'EXECUTE spTop3EmpleadoConMasValor;';
    executeQuery(res, query);
});
//*********************************************************************************************************************************************************/

//Setting up server
var server = app.listen(port, function () {
    console.log('BDA1 API server started on: ' + port);
});