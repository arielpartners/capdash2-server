class DiagnosticsController < ApplicationController

  def info
    data = {
      name: "capdash2",
      version: '0.0.1',
      description: "Shelter Capacity Dashboard",
      hostname: request.host,
      rails_version: Rails.version,
      rails_environment: Rails.env,
      database_adapter: ActiveRecord::Base.connection.adapter_name
    }
    render json: data
  end

end
