'use strict';
module.exports = function (app) {
  var challenge = require('../controllers/challengeController');

  // todoList Routes
  app.route('/challenges')
    .get(challenge.list_all_challenges)
    .post(challenge.create_a_challenge);


  app.route('/challenges/:_idTeam')
    .get(challenge.read_a_challenge)
    .put(challenge.update_a_challenge)
    .delete(challenge.delete_a_challenge);
};