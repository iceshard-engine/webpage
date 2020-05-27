import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"
import PageWidget from require "widgets.common.page"
import JumbotronWidget from require "widgets.common.jumbotron"

import Article, ArticleHistory from require "models"
import preload from require "lapis.db.model"

class MainDashboardPage extends Widget
  content: =>
    widget MenuWidget
    widget JumbotronWidget

    div class:'container', ->

      article = Article\find identifier:'main'
      -- preload { article }, "published"

      if article and article.published_revision and article.published_revision ~= 0

        if article_revision = ArticleHistory\find article_id:article.id, revision:article.published_revision
          h2 class:'h2', "#{article_revision.title}"
          p class:'text', "#{article_revision.content}"

        else
          h2 class:'h2', "ERROR: Article not properly published!"

      else
        h2 class:'h2', "Welcome!"
