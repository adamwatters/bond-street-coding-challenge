require 'test_helper'

class StepsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect to root if user is not logged in" do
    get '/step/1'
    assert_redirected_to '/'
  end

  test "should redirect to root if user is logged in but step at index doesnt exist" do
    post signup_path, params: {user: {name: 'adam'}}
    get '/step/100'
    assert_redirected_to '/'
  end

  test "should redirect to root if user is logged in but step is unreachable" do
    post signup_path, params: {user: {name: 'adam'}}
    get '/step/3'
    assert_redirected_to '/'
  end

  test "should show logged in user their reachable steps" do
    post signup_path, params: {user: {name: 'adam'}}
    get '/step/1'
    assert_response :success
  end

end
