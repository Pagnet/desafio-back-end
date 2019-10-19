require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get list_files" do
    get dashboard_list_files_url
    assert_response :success
  end

  test "should get view_files" do
    get dashboard_view_files_url
    assert_response :success
  end

end
