class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :set_current_user

  private

  def set_current_user
    @current_user = session[:user_id] ? User.find(session[:user_id]) || nil : nil
  end

  def should_be_guest_user
    if @current_user
      flash[:danger] = "Already logged in as #{@current_user.name}"
      redirect_to root_url
    end
  end
end
