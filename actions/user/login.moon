csrf = require "lapis.csrf"
config = require("lapis.config").get!

import User from require "models"
import Action from require "actions.action"
import validate from require "lapis.validate"
import to_json from require "lapis.util"
import encode_base64, hmac_sha256 from require "lapis.util.encoding"

class LoginUserAction extends Action
  execute: =>
    csrf.assert_token @

    -- Validate the register form
    validation_errors = validate @POST, {
      { 'username', "Invalid username", exists:true, min_length:3, max_length:24 }
      { 'password', "Invalid password", exists:true, min_length:8, max_length:36 }
    }

    -- When we pass initial validation
    unless validation_errors
      validation_errors = { }

      -- Check if user can be accessed
      if user = User\find username:@POST.username, password:encode_base64 hmac_sha256 config.secret, @POST.password
        -- Save in session
        @session.username = user.username

      else
        table.insert validation_errors, "Invalid username or password"


    -- Check final results
    if #validation_errors > 0
      @cookies.login_form_errors = to_json validation_errors
      return redirect_to: @url_for 'user_login'

    else
      return redirect_to: @url_for 'user_account'
