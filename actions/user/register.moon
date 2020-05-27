csrf = require "lapis.csrf"

import Action from require "actions.action"
import validate from require "lapis.validate"
import from_json, to_json, hmac_sha1 from require "lapis.util"

class RegisterUserAction extends Action
  execute: =>
    csrf.assert_token @

    -- Validate the register form
    validation_errors = validate @POST, {
      { 'username', "Invalid username", exists:true, min_length:3, max_length:24 }
      { 'password', "Invalid password", exists:true, min_length:8, max_length:36 }
      { 'repassword', "Passwords do not match", equals:@POST.password }
      -- { 'email', exists:true, min_length:3 }
      -- { 'accept_terms', equals:'yes', "You must accept the Terms of Service" }
    }

    if validation_errors
      @cookies.register_form_errors = to_json validation_errors

    else
      nil
    -- User\create {
    --   username:@POST.username
    --   password:hmac_sha1 config.secret, @POST.password
    -- }

    redirect_to: @url_for 'user_login'
