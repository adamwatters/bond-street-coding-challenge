require 'test_helper'

class StepSequenceTest < ActiveSupport::TestCase

  def setup
    @user = User.create({name: 'testUser'})
    @step_sequence = @user.step_sequence
  end

  test "creates five steps when created" do
    assert @step_sequence.steps.length === 5
  end

  test "has attribute current_step_index that defaults to 0" do
    assert @step_sequence.current_step_index === 0
  end

  test "can be asked if it contains steps at a certain index" do
    assert_not @step_sequence.has_step_at(-1)
    assert @step_sequence.has_step_at(0)
    assert @step_sequence.has_step_at(1)
    assert @step_sequence.has_step_at(2)
    assert @step_sequence.has_step_at(3)
    assert @step_sequence.has_step_at(4)
    assert_not @step_sequence.has_step_at(5)
  end

  test "has a method 'can_reach' that returns true if a step is reachable" do
    step_one = @step_sequence.steps[0]
    step_two = @step_sequence.steps[1]
    step_three = @step_sequence.steps[2]
    assert @step_sequence.can_reach(step_one)
    assert_not @step_sequence.can_reach(step_two)
    assert_not @step_sequence.can_reach(step_three)
    step_one.update({is_complete: true})
    assert @step_sequence.can_reach(step_one)
    assert @step_sequence.can_reach(step_two)
    assert_not @step_sequence.can_reach(step_three)
  end

  test "has a method 'first_reachable' that returns first reachable step" do
    assert @step_sequence.first_reachable === @step_sequence.steps[0]
    @step_sequence.steps[0].update({is_complete: true})
    assert @step_sequence.first_reachable === @step_sequence.steps[1]
  end

end
