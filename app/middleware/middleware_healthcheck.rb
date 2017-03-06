#
# Endpoint to determine health of application.  Note this does NOT hit the database
# If you want to also determine the health of the database, consider the /info endpoint
# https://thisdata.com/blog/making-a-rails-health-check-that-doesnt-hit-the-database/
#
class MiddlewareHealthcheck
  NO_CONTENT = [ 204, {}, [] ]

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'.freeze] == '/healthcheck'.freeze
      return NO_CONTENT
    else
      @app.call(env)
    end
  end
end