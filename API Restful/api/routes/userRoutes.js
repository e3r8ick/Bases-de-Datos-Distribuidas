'use strict';
module.exports = function (app) {
var user = require('../controllers/userController');
var express = require('express');
var bodyParser = require("body-parser");
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

  // todoList Routes
  app.route('/users')
    .get(user.list_all_users)
    .post(user.create_a_user);


  app.route('/users/:_id')
    .get(user.read_a_user)
    .put(user.update_a_user)
    .delete(user.delete_a_user);
};