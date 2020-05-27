import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"

class UserAccountWidget extends Widget
  content: =>
    widget MenuWidget

    div class:'container', ->
      div class:'row', ->

        --[[ User login form ]]
        div class:'col-5', ->
          h2 class:'h2', "User login"

          form method:'POST', action: (@url_for 'user_login'), ->
            div class:'form-group', ->
              label for:'username', "User name"
              input id:'username', name:'username', type:'text', class:'form-control', placeholder:"User name"

            div class:'form-group', ->
              label for:'password', "Password"
              input id:'password', name:'password', type:'password', class:'form-control', placeholder:"Password"

            for error_message in *@login_form_errors
              div class:'alert alert-danger', role:'alert', error_message

            input type:'hidden', name:'csrf_token', value: @csrf_token
            input type:'submit', value:"Login"

        --[[ User register form ]]
        div class:'col-5', ->
          h2 class:'h2', "Register"

          form method:'POST', action: (@url_for 'user_register'), ->
            div class:'form-group', ->
              label for:'username', "User name"
              input id:'username', name:'username', type:'text', class:'form-control', placeholder:"User name"

            div class:'form-group', ->
              label for:'password', "Password"
              input id:'password', name:'password', type:'password', class:'form-control', placeholder:"Password"

            div class:'form-group', ->
              label for:'password-repeat', "Repeat password"
              input id:'password-repeat', name:'repassword', type:'password', class:'form-control'

            for error_message in *@register_form_errors
              div class:'alert alert-danger', role:'alert', error_message

            input type:'hidden', name:'csrf_token', value: @csrf_token
            input type:'submit', value:"Register"
