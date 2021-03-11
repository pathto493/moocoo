require 'test_helper'

class DurationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get duration_show_url
    assert_response :success
  end

end
