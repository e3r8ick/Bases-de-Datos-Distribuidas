'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var NewsSchema = new Schema({
  _idSport: String,
  title: String,
  story: String
}, {
    versionKey: false // You should be aware of the outcome after set to false
  });

module.exports = mongoose.model('News', NewsSchema);