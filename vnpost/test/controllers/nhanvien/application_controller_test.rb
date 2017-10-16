require 'test_helper'

class Nhanvien::ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nhanvien_application_index_url
    assert_response :success
  end

end
