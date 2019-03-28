'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var ChallengeSchema = new Schema({
  _idTeam1: String,
  _idTeam2: String,
  _idWinner: String
}, {
    versionKey: false // You should be aware of the outcome after set to false
  });

module.exports = mongoose.model('Challenges', ChallengeSchema);