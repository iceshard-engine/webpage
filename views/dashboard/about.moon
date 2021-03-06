import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"
import PageWidget from require "widgets.common.page"
import JumbotronWidget from require "widgets.common.jumbotron"

import Article, ArticleHistory from require "models"
import preload from require "lapis.db.model"

class AboutPage extends Widget
  content: =>
    widget MenuWidget
    widget JumbotronWidget

    div class:'container', ->
        h2 class:'h2', "The `IceShard` project"
