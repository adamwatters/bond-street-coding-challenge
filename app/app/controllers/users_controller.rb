class UsersController < ApplicationController
  before_action :should_be_guest_user, only: [:new, :create]
  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
