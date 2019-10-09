require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landing_index_url
    assert_response :success
  end

  test "should get features" do
    get landing_features_url
    assert_response :success
  end

  test "should get pricing" do
    get landing_pricing_url
    assert_response :success
  end

end
