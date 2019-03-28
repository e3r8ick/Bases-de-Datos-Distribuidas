'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var SportSchema = new Schema({
  _id: { type: String, unique: true },
  name: String
}, {
    versionKey: false // You should be aware of the outcome after set to false
  });

module.exports = mongoose.model('Sports', SportSchema);