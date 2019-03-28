'use strict';


var mongoose = require('mongoose'),
  Team = mongoose.model('Teams');


exports.list_all_teams = function (req, res) {
  Team.find({}, function (err, team) {
    if (err)
      res.send(err);
    res.json(team);
  });
};


exports.create_a_team = function (req, res) {
  console.log(req.body);
  var new_team = new Team(req.body);
  new_team.save(function (err, team) {
    if (err)
      res.send(err);
    res.json(team);
  });
};


exports.read_a_team_by_sport = function (req, res) {
  Team.find({_idSport: req.params._idSport}, function (err, team) {
    if (err)
      res.send(err);
    res.json(team);
  });
};


exports.read_a_team = function (req, res) {
  Team.findById(req.params._id, function (err, team) {
    if (err)
      res.send(err);
    res.json(team);
  });
};


exports.update_a_team = function (req, res) {
  Team.findOneAndUpdate({ _id: req.params._id }, req.body, { new: true }, function (err, team) {
    if (err)
      res.send(err);
    res.json(team);
  });
};


exports.delete_a_team = function (req, res) {
  Team.remove({
    _id: req.params._id
  }, function (err, team) {
    if (err)
      res.send(err);
    res.json({ message: 'Team successfully deleted' });
  });
};