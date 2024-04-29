require "test_helper"

class UserServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_services_new_url
    assert_response :success
  end

  test "should get create" do
    get user_services_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_services_destroy_url
    assert_response :success
  end
end
