require 'test_helper'

class ImporterControllerTest < ActionDispatch::IntegrationTest
  test "should get files" do
    get importer_files_url
    assert_response :success
  end

end
