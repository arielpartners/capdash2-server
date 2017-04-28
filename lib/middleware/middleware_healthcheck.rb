#
# Endpoint to determine health of application.  Note this does NOT hit the
# database. If you want to also determine the health of the database, consider
# the /info endpoint
# https://thisdata.com/blog/making-a-rails-health-check-that-doesnt-hit-the-database/
#
class MiddlewareHealthcheck
  def initialize(app)
    @app = app
  end

  def call(env)
    return [204, {}, []] if env['PATH_INFO'.freeze] == '/api/healthcheck'.freeze
    @app.call(env)
  end
end
