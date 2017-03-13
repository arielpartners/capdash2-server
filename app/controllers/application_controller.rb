# Controller parent class. Includes knock for jwt authentication
class ApplicationController < ActionController::API
  include Knock::Authenticable
end
