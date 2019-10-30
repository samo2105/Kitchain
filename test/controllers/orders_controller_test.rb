require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get orders_create_url
    assert_response :success
  end

  test "should get delete" do
    get orders_delete_url
    assert_response :success
  end

end
