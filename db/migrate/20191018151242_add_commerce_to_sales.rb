class AddCommerceToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :commerce
  end
end
