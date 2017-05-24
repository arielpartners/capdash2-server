module AuthHelper
  def include_auth_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.headers['Authorization'] = "Bearer #{token}"
    request.headers['Accept'] = 'application/json'
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :controller
end
