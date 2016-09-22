require 'test_helper'

class AdminAreaControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_area_show_url
    assert_response :success
  end

end
