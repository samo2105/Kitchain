class AddWorkerToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :worker
  end
end
