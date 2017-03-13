module Errors
  # Custom exception class so that we can call statsD when knock authentication
  # fails (ie failed logins)
  class LoginFailure < ActiveRecord::RecordNotFound
    def initialize
      StatsD.increment('User.login.failure')
      super
    end
  end
end
