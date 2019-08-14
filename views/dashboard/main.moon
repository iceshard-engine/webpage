import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"
import PageWidget from require "widgets.common.page"

import Articles, ArticleHistory from require "models"
import preload from require "lapis.db.model"

class MainDashboardWidget extends Widget
  content: =>
    widget MenuWidget

    div class:'jumbotron jumbotron-fluid', ->
      div class:'container', ->
        h1 class:'display-4', "Hello Traveler!"
        p class:'lead', "Welcome on this website, it's far from completed but feel free to take a look :)"


    div class:'container', ->

      article = Articles\find identifier:'main'
      -- preload { article }, "published"

      if article and article.published_revision and article.published_revision ~= 0
        if article_revision = ArticleHistory\find article_id:article.id, revision:article.published_revision
          h2 class:'h2', "#{article_revision.title}"
          p class:'text', "#{article_revision.content}"
          -- p class:'text', "revision: #{article_revision.revision}, created: #{article.created_at}, updated: #{article.updated_at}"
        else
          h2 class:'h2', "ERROR: Article not properly published!"
      else
        h2 class:'h2', "Welcome!"
