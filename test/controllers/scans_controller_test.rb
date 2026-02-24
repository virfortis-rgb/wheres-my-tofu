require "test_helper"

class ScansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scans_new_url
    assert_response :success
  end

  test "should get create" do
    get scans_create_url
    assert_response :success
  end
end
