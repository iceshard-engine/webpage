import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"

import Article, ArticleHistory from require "models"
import preload from require "lapis.db.model"

class ErrorPage extends Widget
  content: =>
    widget MenuWidget

    div class:'container', ->
        h2 class:'h2', "Ups... an ice block fell down on our servers!"
        p class:'p', "We will try to melt it down as soon as possible!"
