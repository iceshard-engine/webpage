import Widget from require "lapis.html"

class PageWidget extends Widget
  content: =>
    div class:'container', ->
      div class:'row', ->
        h1 class:'mt-3 display-4', "#{@title}"

      div class:'row', ->


{ :PageWidget }
