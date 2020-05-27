import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"

class LogoDashboardPage extends Widget
  content: =>
    div class:'container', style:'margin:auto;width:410px;;margin-top:15%;', ->
      div class:'row', style:'transform:rotate(0);', ->

        div style:'width:45px;padding-top:15px', ->
          a href:'/main', class:'text-decoration-none', ->
            img src:'/static/iceshard_I_char_h512.png', height:'128px', width:'40px'

        div ->
          a href:'/main', class:'text-decoration-none', ->
            h1 class:'display-1', style:"color:#749EAD;", "IceShard"
          h6 class:'text-muted ml-2', "- Just another game engine."
