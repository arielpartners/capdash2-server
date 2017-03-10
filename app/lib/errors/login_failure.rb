module Errors
  class LoginFailure < ActiveRecord::RecordNotFound
    def initialize
      StatsD.increment('User.login.failure')
      super
    end
  end
end
