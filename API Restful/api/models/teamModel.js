'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var TeamSchema = new Schema({
  _id: { type: String, unique: true },
  _idSport: String,
  name: String,
  members: {
    idMember1: String,
    idMember2: String,
    idMember3: String,
    idMember4: String,
    idMember5: String
  }
}, {
    versionKey: false // You should be aware of the outcome after set to false
  });

module.exports = mongoose.model('Teams', TeamSchema);                                                         