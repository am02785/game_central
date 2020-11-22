require 'test_helper'

# tests the home controller.
class HomeControllerTest < ActionDispatch::IntegrationTest

  # tests whether we can perform a get on home.
  test "should get home" do
    get root_url
    assert_response :success
    
    assert_select 'p', 'Welcome to the game central store.' # tests the content of the p element
  end

end
