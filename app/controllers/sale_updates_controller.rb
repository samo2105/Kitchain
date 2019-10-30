class SaleUpdatesController < ApplicationController
  before_action :find_sale
  skip_authorization_check

  def payed
    if @sale.payed
      @sale.payed = false
    else
      @sale.payed = true
    end
    @sale.save
    respond_to do |format|
      format.js
    end
  end

  def given
    @sale.state = 3
    @sale.save
    respond_to do |format|
      format.js
    end
  end

  def ready
    if @sale.state == 1
      @sale.state = 2
    else
      @sale.state = 1
    end
    @sale.save
    respond_to do |format|
      format.js
    end
  end

  def done
    if @sale.payed && @sale.state == 3
      @sale.state = 4
      @sale.save
      respond_to do |format|
        format.js { render layout: false }
      end
    else
      flash[:alert] = 'La venta debe esta pagada y entregada'
      redirect_to request.referrer
    end
  end

  private
  def find_sale
    @sale = Sale.find(params[:id])
  end
end
