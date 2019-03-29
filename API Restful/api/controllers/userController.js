'use strict';

// var express = require('express');
// var bodyParser = require("body-parser");
// var app = express();
var sql = require("mssql/msnodesqlv8");
var config = {    
  driver: 'msnodesqlv8',
  connectionString:'Driver={SQL Server Native Client 11.0};Server={localhost\\SQLExpress};Database={AdvancedInc};Trusted_Connection={yes};'
};

// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({ extended: true }));

exports.list_all_users = function (req, res) {
  // res.json('Test funciona');
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
        res.send(recordset.recordset);
        sql.close();
        
      });
  });
};


exports.create_a_user = function (req, res) {
    res.send(req.json);  
    console.log(req.json);

  // var new_user = new User(req.body);
  // new_user.save(function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.read_a_user = function (req, res) {
  // User.findById(req.params._id, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.update_a_user = function (req, res) {
  // User.findOneAndUpdate({ _id: req.params._id }, req.body, { new: true }, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.delete_a_user = function (req, res) {
  // User.remove({
  //   _id: req.params._id
  // }, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json({ message: 'User successfully deleted' });
  // });
};