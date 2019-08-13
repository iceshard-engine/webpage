lapis = require "lapis"

class extends lapis.Application
  layout: require 'views.layout'

  --[[ Redirects ]]
  [redirect: '/(*)']: =>
    return redirect_to:@url_for "logo"

  [logo: '/logo']: =>
    render: require 'views.dashboard.logo'

  --[[ Application ]]
  [dashboard: '/main']: =>
    render: require 'views.dashboard.main'
