class DiagnosticsController < ApplicationController
  before_action :authenticate_user

  def info
    data = {
      name: Cdserver::Application::NAME,
      version: Cdserver::Application::VERSION,
      description: Cdserver::Application::DESCRIPTION,
      hostname: request.host,
      rails_version: Rails.version,
      rails_environment: Rails.env,
      database_adapter: ActiveRecord::Base.connection.adapter_name
    }
    render json: data
  end

end
