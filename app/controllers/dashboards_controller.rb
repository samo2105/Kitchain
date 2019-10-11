class DashboardsController < ApplicationController
  before_action :authenticate_commerce!, only: [:commerce_index, :commerce_sales, :commerce_kitchen, :commerce_generals]
  before_action :authenticate_worker!, only: [:workers_index, :workers_kitchen, :workers_sales, :workers_products, :workers_tables]
  before_action :find_commerce_params, only: [:commerce_index, :commerce_sales, :commerce_kitchen, :commerce_generals]
  def commerce_index
  end

  def commerce_sales
  end

  def commerce_kitchen
  end

  def commerce_generals
  end

  def workers_index
  end

  def workers_kitchen
  end

  def workers_products
  end

  def workers_sales
  end

  def workers_tables
  end

  private

  def find_commerce_params
    @commerce = current_commerce
    @commerce_offices = @commerce.offices
    @commerce_products = Product.where(office_id: @commerce_offices.ids)
    @commerce_workers = Worker.where(office_id: @commerce_offices.ids)
    @commerce_sales = Sale.where(worker_id: @commerce_workers.ids)
    @commerce_orders = Order.where(sale_id: @commerce_sales.ids, product_id: @commerce_products.ids)
  end
end
