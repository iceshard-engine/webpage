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

  [contact: '/contact']: =>
    render: require 'views.dashboard.contact'

  @before_filter =>
    @navbar = {
      { active:@route_name == 'dashboard', disabled:false, url:(@url_for 'dashboard'), text:'Home' }
      { active:@route_name == 'about', disabled:true,  url:'#', text:'About' }
      { active:@route_name == 'contact', disabled:false, url:(@url_for 'contact'), text:'Contact' }
    }
