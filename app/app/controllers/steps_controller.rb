class StepsController < ApplicationController
  def show
    index = params[:position].to_i - 1
    if not @step_sequence
      flash[:danger] = 'Please log in.'
      redirect_to root_url
    elsif not @step_sequence.has_step_at(index)
      flash[:danger] = 'Invalid step'
      redirect_to root_url
    else
      @step = @step_sequence.steps[index]
      if not @step.reachable?
        flash[:danger] = "Step #{index + 1} is out of reach"
        redirect_to root_url
      else
        @step_sequence.update({current_step_index: index})
      end
    end
  end

  def update
    index = params[:position].to_i - 1
    if @step_sequence.has_step_at(index)
      @step = @step_sequence.steps[index]
      @step.update({is_complete: true})
      redirect_to @step_sequence.first_reachable
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
