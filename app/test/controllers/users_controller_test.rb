require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new user at signup path" do
    get signup_path
    assert_response :success
  end

  test "should reject new users without a name" do
    assert_no_difference 'User.count' do
      post signup_path, params: {user: {name: ''}}
    end
  end

  test "should accept new users with a name and redirect to root" do
    assert_difference 'User.count' do
      post signup_path, params: {user: {name: 'adam'}}
    end
    assert_redirected_to '/'
  end

end
