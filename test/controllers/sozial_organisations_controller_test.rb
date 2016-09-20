require 'test_helper'

class SozialOrganisationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sozial_organisations_index_url
    assert_response :success
  end

  test "should get show" do
    get sozial_organisations_show_url
    assert_response :success
  end

  test "should get new" do
    get sozial_organisations_new_url
    assert_response :success
  end

  test "should get create" do
    get sozial_organisations_create_url
    assert_response :success
  end

end
