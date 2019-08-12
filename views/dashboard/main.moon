import Widget from require "lapis.html"

class DashboardWidget extends Widget
  content: =>
    div class:'container', style:'margin:auto;width:410px;;margin-top:15%;', ->
      div class:'row', ->
        div style:'width:45px;padding-top:20px', ->
          img src:'/static/iceshard_I_char_h512.png', height:'128px', width:'40px'
        div ->
          h1 class:'display-1', style:"color:#749EAD;", "ceShard"
          h6 class:'text-muted ml-2', "- Just another game engine."
