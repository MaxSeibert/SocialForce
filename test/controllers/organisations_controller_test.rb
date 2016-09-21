require 'test_helper'

class OrganisationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organisations_index_url
    assert_response :success
  end

  test "should get new" do
    get organisations_new_url
    assert_response :success
  end

  test "should get show" do
    get organisations_show_url
    assert_response :success
  end

end
