class DiagnosticsController < ApplicationController

  def info
    data = {
      name: MySite::Application::NAME,
      version: MySite::Application::VERSION,
      description: MySite::Application::DESCRIPTION,
      hostname: request.host,
      rails_version: MySite::Application::RAILS_VERSION,
      rails_environment: MySite::Application::RAILS_ENVIRONMENT,
      database_adapter: MySite::Application::DATABASE_ADAPTER
    }
    render json: data
  end

end
