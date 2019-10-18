class AddOfficesToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :office, foreign_key: true
  end
end
