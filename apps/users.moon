lapis = require "lapis"
csrf = require "lapis.csrf"

import handle_request from require "actions.action"
import respond_to, yield_error, capture_errors from require "lapis.application"
import from_json, to_json, hmac_sha1 from require "lapis.util"

import User from require "models"

class UsersApp extends lapis.Application
  @path: '/user'
  @name: 'user_'

  layout: require 'views.layout'

  --[[ Always login if not the case ]]
  [register:'/register']: handle_request {
    POST: =>
      action: require "actions.user.register"
  }

  [login:'/login']: handle_request {
    before: =>
      if @session.username
        @user = User\find username:@session.username
        redirect_to: require 'views.user.account'

    GET: =>
      @csrf_token = csrf.generate_token @

      @login_form_errors = from_json @cookies.login_form_errors or '{}'
      @register_form_errors = from_json @cookies.register_form_errors or '{}'
      @cookies.login_form_errors = '{}'
      @cookies.register_form_errors = '{}'

      render: 'user.login'

    POST: capture_errors =>
      action: require "actions.user.login"
  }


  --[[ Logged in user pages ]]
  [account:'/:username']: =>
    if not @params.username or not @session.username
      return redirect_to: @url_for 'user_login'

    render: 'user.account'
