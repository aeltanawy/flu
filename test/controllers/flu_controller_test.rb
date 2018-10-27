require 'test_helper'

class FluControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flu_index_url
    assert_response :success
  end

end
