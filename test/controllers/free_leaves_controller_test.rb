require 'test_helper'

class FreeLeavesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get free_leaves_index_url
    assert_response :success
  end

  test "should get new" do
    get free_leaves_new_url
    assert_response :success
  end

  test "should get create" do
    get free_leaves_create_url
    assert_response :success
  end

end
