#
# Controller for maintaining information about application users
#
class UsersController < ApplicationController
  before_action :authenticate_user
  def current
    @user = current_user
    render 'show'
  end
end
