require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "user")
    @other_user = User.new(name: "other user")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name should be unique" do
    @other_user.name = @user.name
    assert @user.save
    assert_not @other_user.save
  end

  test "should create step_sequence when saved" do
    assert_not @user.step_sequence
    assert @user.save
    assert @user.step_sequence
  end

end
