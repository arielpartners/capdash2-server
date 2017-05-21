#
# Main authentication controller for logging in.
# Generates JWT user tokens. includes hook for statsD
#
# @see https://jwt.io/introduction/
#
class UserTokenController < Knock::AuthTokenController
  after_action :record_login

  private

  def record_login
    StatsD.increment('User.login.success') if response.status == 201
  end
end
