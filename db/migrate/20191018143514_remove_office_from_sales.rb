class RemoveOfficeFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sales, :office, foreign_key: true
  end
end
