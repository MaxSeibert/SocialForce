require 'test_helper'

class SesseionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sesseions_new_url
    assert_response :success
  end

  test "should get create" do
    get sesseions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sesseions_destroy_url
    assert_response :success
  end

end
