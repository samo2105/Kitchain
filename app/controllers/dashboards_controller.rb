class DashboardsController < ApplicationController
  skip_authorization_check
  before_action :authenticate_commerce!, only: [:commerce_index, :commerce_sales, :commerce_kitchen, :commerce_generals]
  before_action :authenticate_worker!, only: [:workers_index, :workers_kitchen, :workers_sales, :workers_products, :workers_tables]
  before_action :find_commerce_params, only: [:commerce_index, :commerce_sales, :commerce_kitchen, :commerce_generals]
  before_action :find_worker_params, only: [:workers_index, :workers_products, :workers_sales, :workers_tables]
  def commerce_index
  end

  def commerce_sales
    date = Date.today
    start_date = date.at_beginning_of_month
    end_date = date.at_end_of_month
    @commerce_month_sales = @sales.where(:created_at => start_date..end_date)
    @commerce_year_sales = @sales.where(:created_at => date.at_beginning_of_year..date.at_end_of_year)
    @commerce_today_sales = @commerce_month_sales.where(created_at: date.at_beginning_of_day..date.at_end_of_day)
    @commerce_sale_chart = {general: @sales.sum {|sale| sale.total}, año: @commerce_year_sales.sum {|sale| sale.total}, mes: @commerce_month_sales.sum{|sale| sale.total}, hoy: @commerce_today_sales.sum{|sale| sale.total}}
    @commerce_office_sales = {}
    @offices.each {|office| @commerce_office_sales[office.name] = office.sales.sum {|sale| sale.total}}
  end

  def commerce_kitchen
    @best_sale = @orders.group(:product_id).sum(:quantity)
    @best_sale_products = {}
    @best_sale.each do |k,v|
      @best_sale_products[@products.find(k)] = v
    end
    @best_sale_products = @best_sale_products.sort_by{|k, v| v}
    @best_sale_chart = @best_sale_products.map{|product, value| [product.name, value]}
    @best_offices_orders = {}
    @offices.each do |office|
      @best_offices_orders[office.name] = office.sales.sum {|sale| sale.orders.count}
    end
  end

  def commerce_generals
  end

  def workers_index
    @worker_month_sales = @worker.sales.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month)
  end

  def workers_kitchen
    @sales = current_worker.office.sales
  end

  def workers_products
  end

  def workers_sales
    @sale = Sale.new
  end

  private

  def find_commerce_params
    @commerce = current_commerce
    @offices = @commerce.offices
    @products = Product.where(office_id: @offices.ids)
    @workers = @commerce.workers
    @sales = @commerce.sales
    @orders = Order.where(sale_id: @sales.ids, product_id: @products.ids)
  end

  def find_worker_params
    @worker = current_worker
    @commerce = current_worker.commerce
    @office = current_worker.office
    @products = @office.products
    @sales = @worker.sales
    @orders = @sales.orders
    @tables = @office.tables
  end
end
