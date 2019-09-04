import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"
import PageWidget from require "widgets.common.page"
import JumbotronWidget from require "widgets.common.jumbotron"

import Articles, ArticleHistory from require "models"
import preload from require "lapis.db.model"

class MainDashboardWidget extends Widget
  content: =>
    widget MenuWidget
    widget JumbotronWidget

    -- Contact info
    div class:'container', ->
      h2 class:'h2', "Contact"
      p class:'text', "Currently you can reach me through the following means:"
