class TablesController < ApplicationController
  load_and_authorize_resource

  def new
    @table = Table.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @table = Table.new(table_params)
    @table.office = current_worker.office
    @table.save
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    if @table.update(table_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    sales = @table.sales
      sales.each do |sale|
        sale.table = nil
      end
    @table.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_table
    @table = Table.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def table_params
    params.require(:table).permit(:description, :size)
  end

end
