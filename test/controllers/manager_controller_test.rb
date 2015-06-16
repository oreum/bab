require 'test_helper'

class ManagerControllerTest < ActionController::TestCase
  test "should get man" do
    get :man
    assert_response :success
  end

end
