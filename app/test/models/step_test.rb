require 'test_helper'

class StepTest < ActiveSupport::TestCase

  def setup
    @user = User.create({name: 'testUser'})
    @step_sequence = @user.step_sequence
    @first_step = @step_sequence.steps[0]
    @second_step = @step_sequence.steps[1]
    @third_step = @step_sequence.steps[2]
  end

  test "has attribute is_complete that defaults to 0" do
    assert_not @first_step.is_complete
  end

  test "has method 'reachable?'" do
    assert @first_step.reachable?
    assert_not @second_step.reachable?
    assert_not @third_step.reachable?
    @first_step.update({is_complete: true})
    assert @first_step.reachable?
    assert @second_step.reachable?
    assert_not @third_step.reachable?
  end


end
