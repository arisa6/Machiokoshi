require "test_helper"

class Admin::OdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_oders_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_oders_update_url
    assert_response :success
  end
end
