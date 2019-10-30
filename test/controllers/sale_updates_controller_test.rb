require 'test_helper'

class SaleUpdatesControllerTest < ActionDispatch::IntegrationTest
  test "should get payed" do
    get sale_updates_payed_url
    assert_response :success
  end

  test "should get given" do
    get sale_updates_given_url
    assert_response :success
  end

  test "should get ready" do
    get sale_updates_ready_url
    assert_response :success
  end

end
