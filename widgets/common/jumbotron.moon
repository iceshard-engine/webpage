import Widget from require "lapis.html"

class JumbotronWidget extends Widget
  content: =>
    div class:'jumbotron jumbotron-fluid', ->
      div class:'container', ->
        h1 class:'display-4', "Hello Traveler!"
        p class:'lead', "Welcome on this website, it's far from completed but feel free to take a look :)"

{ :JumbotronWidget }
