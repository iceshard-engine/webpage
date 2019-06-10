lapis = require "lapis"

class extends lapis.Application
  layout: require 'views.layout'

  --[[ Retours ]]
  [redirect: '/*']: =>
    return redirect_to:@url_for "dashboard"

  --[[ Application ]]
  [dashboard: '/']: =>
    render: require 'views.dashboard.main'
