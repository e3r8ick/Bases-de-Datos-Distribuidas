'use strict';


// var mongoose = require('mongoose'),
//   User = mongoose.model('Users');


exports.list_all_users = function (req, res) {
  res.json('Test funciona');
  // User.find({}, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.create_a_user = function (req, res) {
  // var new_user = new User(req.body);
  // new_user.save(function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.read_a_user = function (req, res) {
  // User.findById(req.params._id, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.update_a_user = function (req, res) {
  // User.findOneAndUpdate({ _id: req.params._id }, req.body, { new: true }, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json(user);
  // });
};


exports.delete_a_user = function (req, res) {
  // User.remove({
  //   _id: req.params._id
  // }, function (err, user) {
  //   if (err)
  //     res.send(err);
  //   res.json({ message: 'User successfully deleted' });
  // });
};