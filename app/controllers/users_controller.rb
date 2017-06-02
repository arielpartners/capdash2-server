#
# Controller for maintaining information about application users
#
class UsersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: :create
  def create
    @user = User.new(user_params)
    if @user.save
      render 'show', status: 201
    else
      head :unprocessable_entity
    end
  end

  def current
    @user = current_user
    render 'show'
  end

  private

  def user_params
    params.permit(:email, :password, :name, :avatar)
  end
end
