require 'test_helper'

class EventManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_managements_index_url
    assert_response :success
  end

end
