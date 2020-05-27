import respond_to, yield_error, capture_errors from require "lapis.application"

--[[ Used to extend Lapis with an Action system ]]
class Action
  new: =>
  execute: =>

--[[ Used to extend request handlig capabilities ]]
handle_request = (tab) ->
  capture_errors {
    --[[ Allows to respond on request errors ]]
    on_error: =>
      result = render: require 'views.general.error'
      result = (tab.on_error @) if tab.on_error
      result

    --[[ Allows to respond on GET and POST events ]]
    respond_to {
      before: tab.before
      GET: tab.GET
      POST: =>
        result = tab.POST @
        if result and result.action
          action = result.action
          unless action.__class.__parent == Action
            yield_error "Actions need to derive from the 'Action' class."

          --[[ This metatable allows us to access action fields if existing ]]
          --[[ * If no such thing exist it will fallback to the 'request' object for lookup ]]
          action_request = setmetatable { request:@, action:action }, {
            __index: (self, key) ->
              action = rawget self, 'action'
              return action[key] if action[key] ~= nil

              request = rawget self, 'request'
              request_value = request[key]
              if (type request_value) == 'function'
                return (...) => request_value request, ...
              else
                return request_value
          }

          -- Run the action
          result = action_request\execute!

        -- Returns the action result
        result
    }
  }

{ :handle_request, :Action }
