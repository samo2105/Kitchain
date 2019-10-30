class OrdersController < ApplicationController
  load_and_authorize_resource
  def create
    @order = Order.new(order_params)
    @order.amount = @order.quantity.to_i * @order.product.price.to_i
    @sale = @order.sale
    @sale.total = 0 unless @sale.total
    @sale.total += @order.amount
    @sale.save
    @product = @order.product
    quantity = @product.quantity.to_i
    quantity -= @order.quantity
    @product.quantity = quantity.to_s
    @product.save
    respond_to do |format|
      if @order.save
        format.js
      else
        redirect_to request.referrer, alert: 'Tu orden no ha podido ser creada'
      end
    end
    end

  def delete
    @sale = @order.sale
    @sale.total -= @order.amount
    @sale.save
    @product = @order.product
    quantity = @product.quantity.to_i
    quantity += @order.quantity
    @product.quantity = quantity.to_s
    @product.save
    @order.destroy
    respond_to do |format|
      format.js
    end
  end
private
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:sale_id, :product_id, :quantity, :amount, :sale_id)
  end
end
