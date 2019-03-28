'use strict';


var mongoose = require('mongoose'),
  TeamMember = mongoose.model('TeamMembers');


exports.list_all_teammembers = function (req, res) {
  TeamMember.find({}, function (err, teammember) {
    if (err)
      res.send(err);
    res.json(teammember);
  });
};


exports.create_a_teammember = function (req, res) {
  var new_teammember = new TeamMember(req.body);
  new_teammember.save(function (err, teammember) {
    if (err)
      res.send(err);
    res.json(teammember);
  });
};


exports.read_a_teammember = function (req, res) {
  TeamMember.findById(req.params._id, function (err, teammember) {
    if (err)
      res.send(err);
    res.json(teammember);
  });
};


exports.update_a_teammember = function (req, res) {
  TeamMember.findOneAndUpdate({ _id: req.params._id }, req.body, { new: true }, function (err, teammember) {
    if (err)
      res.send(err);
    res.json(teammember);
  });
};


exports.delete_a_teammember = function (req, res) {
  TeamMember.remove({
    _id: req.params._id
  }, function (err, teammember) {
    if (err)
      res.send(err);
    res.json({ message: 'Team Member successfully deleted' });
  });
};