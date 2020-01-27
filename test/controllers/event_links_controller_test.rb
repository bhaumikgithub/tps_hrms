require 'test_helper'

class EventLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_links_index_url
    assert_response :success
  end

  test "should get new" do
    get event_links_new_url
    assert_response :success
  end

  test "should get edit" do
    get event_links_edit_url
    assert_response :success
  end

end
