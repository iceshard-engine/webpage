-- config.moon
config = require "lapis.config"

-- Resolve the host name to IP
f = io.popen '/usr/bin/getent hosts postgres_postgres_db_1'
host_ip = (f\read "*l")\match "[^%s]+"
f\close!

config "development", ->
  port 80

  -- Mandatory
  session_name os.getenv 'APP_SESSION_NAME'
  secret os.getenv 'APP_SECRET'

  -- Database
  postgres ->
    host host_ip
    user os.getenv 'POSTGRES_USER'
    password os.getenv 'POSTGRES_PASSWORD'
    database os.getenv 'POSTGRES_DATABASE'

config "production", ->
  port 80
  num_workers 4
  code_cache "on"
