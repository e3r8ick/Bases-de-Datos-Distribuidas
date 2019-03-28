'use strict';
module.exports = function (app) {
  var sport = require('../controllers/sportController');

  // todoList Routes
  app.route('/sports')
    .get(sport.list_all_sports)
    .post(sport.create_a_sport);


  app.route('/sports/:sportId')
    .get(sport.read_a_sport)
    .put(sport.update_a_sport)
    .delete(sport.delete_a_sport);
};