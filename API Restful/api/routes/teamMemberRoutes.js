'use strict';
module.exports = function (app) {
  var teamMember = require('../controllers/teamMemberController');

  // todoList Routes
  app.route('/teamMembers')
    .get(teamMember.list_all_teammembers)
    .post(teamMember.create_a_teammember);


  app.route('/teamMembers/:_id')
    .get(teamMember.read_a_teammember)
    .put(teamMember.update_a_teammember)
    .delete(teamMember.delete_a_teammember);
};