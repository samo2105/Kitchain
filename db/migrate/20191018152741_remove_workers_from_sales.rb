class RemoveWorkersFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sales, :worker, foreign_key: true
  end
end
