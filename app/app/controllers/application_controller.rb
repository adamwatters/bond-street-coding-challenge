class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :set_step_sequence_for_current_user

  private

  def set_current_user
    @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def set_step_sequence_for_current_user
    @step_sequence = @current_user ? @current_user.step_sequence : nil
  end

  def should_be_guest_user
    if @current_user
      flash[:danger] = "Already logged in as #{@current_user.name}"
      redirect_to root_url
    end
  end
end
