class AddStateToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :state, :integer, default: 1
  end
end
