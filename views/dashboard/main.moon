import Widget from require "lapis.html"

class DashboardWidget extends Widget
  content: =>
    div class:'container', style:'margin-top:15%;', ->
      div style:'margin:auto;width:31%;', ->
        h1 class:'display-1', style:"color:#749EAD;", "IceShard"
        h6 class:'text-muted ml-2', "- Just another game engine."
