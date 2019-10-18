class AddOfficeidToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :office
  end
end
