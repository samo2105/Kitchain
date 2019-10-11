require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get commerce_index" do
    get dashboards_commerce_index_url
    assert_response :success
  end

  test "should get commerce_sales" do
    get dashboards_commerce_sales_url
    assert_response :success
  end

  test "should get commerce_kitchen" do
    get dashboards_commerce_kitchen_url
    assert_response :success
  end

  test "should get commerce_generals" do
    get dashboards_commerce_generals_url
    assert_response :success
  end

  test "should get workers_index" do
    get dashboards_workers_index_url
    assert_response :success
  end

  test "should get workers_kitchen" do
    get dashboards_workers_kitchen_url
    assert_response :success
  end

  test "should get workers_products" do
    get dashboards_workers_products_url
    assert_response :success
  end

  test "should get workers_sales" do
    get dashboards_workers_sales_url
    assert_response :success
  end

  test "should get workers_tables" do
    get dashboards_workers_tables_url
    assert_response :success
  end

end
