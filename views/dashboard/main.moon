import Widget from require "lapis.html"
import MenuWidget from require "widgets.common.menu"

class MainDashboardWidget extends Widget
  content: =>
    widget MenuWidget!
