'use strict';


var mongoose = require('mongoose'),
  Challenge = mongoose.model('Challenges');


exports.list_all_challenges = function (req, res) {
  Challenge.find({}, function (err, challenge) {
    if (err)
      res.send(err);
    res.json(challenge);
  });
};


exports.create_a_challenge = function (req, res) {
  var new_challenge = new Challenge(req.body);
  new_challenge.save(function (err, challenge) {
    if (err)
      res.send(err);
    res.json(challenge);
  });
};


exports.read_a_challenge = function (req, res) {
  Challenge.find({ $or: [{ '_idTeam1': req.params._idTeam }, { '_idTeam2': req.params._idTeam }] }, function (err, challenge) {
    if (err)
      res.send(err);
    res.json(challenge);
  });
};


exports.update_a_challenge = function (req, res) {
  Challenge.findOneAndUpdate({ _id: req.params._id }, req.body, { new: true }, function (err, challenge) {
    if (err)
      res.send(err);
    res.json(challenge);
  });
};


exports.delete_a_challenge = function (req, res) {
  Challenge.remove({
    _id: req.params._id
  }, function (err, challenge) {
    if (err)
      res.send(err);
    res.json({ message: 'Challenge successfully deleted' });
  });
};