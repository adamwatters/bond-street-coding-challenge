class StepsController < ApplicationController
  def show
    index = params[:position].to_i - 1
    if @step_sequence.has_step_at(index)
      @step = @step_sequence.steps[index]
      unless @step.reachable?
        flash[:danger] = "Step #{index + 1} is out of reach"
        redirect_to root_url
      end
    else
      flash[:danger] = 'Invalid step'
      redirect_to root_url
    end
  end
end
