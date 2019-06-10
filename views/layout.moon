import Widget from require "lapis.html"

class DefaultLayout extends Widget
  content: =>
    html_5 ->
      head ->
        meta charset:"UTF-8"
        title @title or "IceShard"

        link -- Bootstrap CSS (4.2.1)
          rel: 'stylesheet'
          href: 'https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css'
          integrity: 'sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS'
          crossorigin: 'anonymous'

        script -- JQuery Slim (3.3.1)
          src: 'https://code.jquery.com/jquery-3.3.1.slim.min.js'
          integrity: 'sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo'
          crossorigin: 'anonymous'

        script -- Bootstrap JS (4.2.1)
          src: 'https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'
          integrity: 'sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k'
          crossorigin: 'anonymous'

        script -- Popper (1.14.6)
          src: 'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'
          integrity: 'sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut'
          crossorigin: 'anonymous'

      body ->
        @content_for 'navbar' if @has_content_for 'navbar'
        @content_for 'inner'
