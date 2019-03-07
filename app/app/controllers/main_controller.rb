class MainController < ApplicationController
  def home
    if @current_user
      redirect_to @step_sequence.steps[@step_sequence.current_step_index]
    else
      @user = User.new
      render 'users/new'
    end
  end
end
