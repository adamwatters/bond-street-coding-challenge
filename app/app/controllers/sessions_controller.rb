class SessionsController < ApplicationController
  before_action :should_be_guest_user, only: [:new, :create]
  def new
    @user = User.new
    render 'login'
  end

  def create
    @user = User.find_by(session_params)
    if @user
      log_in(@user)
      redirect_to root_url
    else
      @user = User.new
      flash.now[:danger] = 'User not found'
      render 'login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    params.require(:user).permit(:name)
  end
end
