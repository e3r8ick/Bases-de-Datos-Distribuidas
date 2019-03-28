'use strict';
module.exports = function (app) {
  var news = require('../controllers/newsController');

  // todoList Routes
  app.route('/news')
    .get(news.list_all_news)
    .post(news.create_a_news);


  app.route('/news/:_id')
    .get(news.read_a_news)
    .put(news.update_a_news)
    .delete(news.delete_a_news);
};