require 'test_helper'

class DichvucongthemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dichvucongthem_index_url
    assert_response :success
  end

end
