require 'test_helper'

class Admin::TableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_table_index_url
    assert_response :success
  end

end
