'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var TeamMemberSchema = new Schema({
  _idTeam: String,
  _idUser: String
}, {
    versionKey: false // You should be aware of the outcome after set to false
  });

module.exports = mongoose.model('TeamMembers', TeamMemberSchema);