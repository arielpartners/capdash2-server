module MySite
  class Application
    NAME = 'capdash2'
    VERSION = '0.0.1'
    DESCRIPTION = "Shelter Capacity Dashboard"
    RAILS_VERSION = Rails.version
    RAILS_ENVIRONMENT = Rails.env
    DATABASE_ADAPTER = ActiveRecord::Base.connection.adapter_name
  end
end
