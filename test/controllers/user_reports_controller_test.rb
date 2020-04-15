require 'test_helper'

class UserReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_reports_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_reports_edit_url
    assert_response :success
  end

  test "should get new" do
    get user_reports_new_url
    assert_response :success
  end

  test "should get show" do
    get user_reports_show_url
    assert_response :success
  end

end
