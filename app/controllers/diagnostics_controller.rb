class DiagnosticsController < ApplicationController

  def info
    data = {
      name: MySite::Application::NAME,
      version: MySite::Application::VERSION,
      description: MySite::Application::DESCRIPTION,
      hostname: request.host,
      rails_version: Rails.version,
      rails_environment: Rails.env,
      database_adapter: ActiveRecord::Base.connection.adapter_name
    }
    render json: data
  end

end
