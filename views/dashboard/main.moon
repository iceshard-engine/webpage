import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"

class MainDashboardWidget extends Widget
  content: =>
    widget MenuWidget!

    div class:'container', ->
      div class:'row', ->
        h1 class:'mt-3 display-4', "Home"

      div class:'row', ->
        article class:'px-3 mt-3', ->
          h2 class:'h2', 'Greetings on the Iceshard engine webpage!'
          p 'This website is dedicated to a small project for a game engine.'
          p 'The project is moving very slowly and consists not only of just coding the engine, but also building other things around it.'
          p 'Feel invited to keep track of this project or contact me if you want to take part in it!'
          h6 class:'h6', 'dandielo'
