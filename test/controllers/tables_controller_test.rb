require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tables_create_url
    assert_response :success
  end

  test "should get edit" do
    get tables_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get tables_destroy_url
    assert_response :success
  end

end
