require 'test_helper'

class DesignationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get designations_index_url
    assert_response :success
  end

  test "should get new" do
    get designations_new_url
    assert_response :success
  end

  test "should get edit" do
    get designations_edit_url
    assert_response :success
  end

end
