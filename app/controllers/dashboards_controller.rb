class DashboardsController < ApplicationController
  before_action :authenticate_commerce!, only: [:commerce_index, :commerce_sales, :commerce_kitchen, :commerce_generals]
  before_action :authenticate_worker!, only: [:workers_index, :workers_kitchen, :workers_sales, :workers_products, :workers_tables]
  before_action :find_commerce_params, only: [:commerce_index, :commerce_sales, :commerce_kitchen, :commerce_generals]
  def commerce_index
  end

  def commerce_sales
    date = Date.today
    start_date = date.at_beginning_of_month
    end_date = date.at_end_of_month
    @commerce_month_sales = @commerce_sales.where(:created_at => start_date..end_date)
    @commerce_today_sales = @commerce_month_sales.where(created_at: date.at_beginning_of_day..date.at_end_of_day)
    @commerce_sale_chart = {general: @commerce_sales.sum {|sale| sale.total}, mes: @commerce_month_sales.sum{|sale| sale.total}, hoy: @commerce_today_sales.sum{|sale| sale.total}}
    @commerce_office_sales = {}
    @commerce_offices.each_with_index {|office, i| @commerce_office_sales[office.name] = office.workers.sum {|worker| worker.sales.sum {|sale| sale.total}}}

  end

  def commerce_kitchen
    @best_sale = @commerce_orders.group(:product_id).sum(:quantity)
    @best_sale_products = {}
    @best_sale.each do |k,v|
      @best_sale_products[@commerce_products.find(k)] = v
    end
    @best_sale_products = @best_sale_products.sort_by{|k, v| v}
    @best_sale_chart = @best_sale_products.map{|product, value| [product.name, value]}
    @best_offices_orders = {}
    @commerce_offices.each do |office|
      @best_offices_orders[office.name] = office.workers.sum {|worker| worker.sales.sum{|sale| sale.orders.count}}
    end
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
