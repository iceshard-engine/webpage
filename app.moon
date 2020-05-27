lapis = require "lapis"

class extends lapis.Application
  layout: require 'views.layout'

  @include "apps.users"

  --[[ Redirects ]]
  [redirect: '/(*)']: =>
    return redirect_to:@url_for "logo"

  [logo: '/logo']: =>
    render: require 'views.dashboard.logo'

  --[[ Application ]]
  [dashboard: '/main']: =>
    render: require 'views.dashboard.main'

  [about: '/about']: =>
    render: require 'views.dashboard.about'

  [contact: '/contact']: =>
    render: require 'views.dashboard.contact'

  --[[ Before anything happenz ]]
  @before_filter =>
    @navbar = {
      {
        active:@route_name == 'dashboard',
        disabled: false,
        url:(@url_for 'dashboard'),
        text:'Home'
      }
      {
        active:@route_name == 'about',
        disabled: false,
        url:(@url_for 'about'),
        text:'About'
      }
      {
        active:@route_name == 'contact',
        disabled: false,
        url:(@url_for 'contact'),
        text:'Contact'
      }
      {
        active:@route_name == 'account',
        disabled: false,
        url:(@url_for 'user_account', username:@session.username or 'unknown'),
        text:'Account'
      }
    }
