require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should reject login when name does not match a user" do
    get login_path
    assert session[:user_id].nil?
    post login_path, params: {user: {name: 'adam'}}
    assert session[:user_id].nil?
    assert_not flash.empty?
  end

  test "should log in user new user, then allow logout and login" do
    get signup_path
    assert session[:user_id].nil?
    post signup_path, params: {user: {name: 'adam'}}
    assert_not session[:user_id].nil?
    delete logout_path
    assert session[:user_id].nil?
    post login_path, params: {user: {name: 'adam'}}
    assert_not session[:user_id].nil?
  end

end
