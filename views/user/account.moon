import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"

class UserAccountWidget extends Widget
  content: =>
    widget MenuWidget

    @content_for 'jumbotron', ->
      div class:'jumbotron jumbotron-fluid', ->
        div class:'container', ->
          h1 class:'display-4', 'User name'
          p class:'lead', "User details"


    div class:'container', ->
        h2 class:'h2', "User account"
