'use strict';


var mongoose = require('mongoose'),
  Sport = mongoose.model('Sports');


exports.list_all_sports = function (req, res) {
  Sport.find({}, function (err, sport) {
    if (err)
      res.send(err);
    res.json(sport);
  });
};


exports.create_a_sport = function (req, res) {
  var new_sport = new Sport(req.body);
  new_sport.save(function (err, sport) {
    if (err)
      res.send(err);
    res.json(sport);
  });
};


exports.read_a_sport = function (req, res) {
  Sport.findById(req.params.sportId, function (err, sport) {
    if (err)
      res.send(err);
    res.json(sport);
  });
};


exports.update_a_sport = function (req, res) {
  Sport.findOneAndUpdate({ sportId: req.params.sportId }, req.body, { new: true }, function (err, sport) {
    if (err)
      res.send(err);
    res.json(sport);
  });
};


exports.delete_a_sport = function (req, res) {
  Sport.remove({
    _id: req.params.sportId
  }, function (err, sport) {
    if (err)
      res.send(err);
    res.json({ message: 'Sport successfully deleted' });
  });
};