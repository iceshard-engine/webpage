import Widget from require "lapis.html"

class MenuWidget extends Widget
  content: =>
    @content_for "navbar", ->
      nav class:'navbar navbar-expand-lg navbar-light bg-light', ->
        div class:'container', style:'font-size:1.2em;', ->

          --
          div class:'col-2', ->
            a class:'navbar-brand', href:'#', ->
              img src:'/static/favico.png', width:'45', height:'45', class:'d-inline-block align-top', alt:''
              span class:'mb-0 h2', "IceShard"

          --
          div class:'col-10', ->
            div class:'navbar-nav', ->

              a class:'nav-item nav-link active', href:'#', "Home"
              a class:'nav-link nav-link disabled', href:'#', "About"
              a class:'nav-link nav-link disabled', href:'#', "Contact"

    @content_for "footer", ->
      div class:'fixed-bottom', style:'background-color:lightgray;', ->
        div class:'container', ->
          div class:'row', ->
            div class:'col-sm', ->
              span class:'align-middle', '© 2019 Daniel Penkała'
            div class:'col-sm-3 float-right text-right', ->
              span class:'align-middle', ''

{ :MenuWidget }
