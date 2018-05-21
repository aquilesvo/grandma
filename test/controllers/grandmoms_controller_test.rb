require 'test_helper'

class GrandmomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grandmoms_index_url
    assert_response :success
  end

  test "should get show" do
    get grandmoms_show_url
    assert_response :success
  end

  test "should get new" do
    get grandmoms_new_url
    assert_response :success
  end

  test "should get create" do
    get grandmoms_create_url
    assert_response :success
  end

  test "should get update" do
    get grandmoms_update_url
    assert_response :success
  end

  test "should get delete" do
    get grandmoms_delete_url
    assert_response :success
  end

end
