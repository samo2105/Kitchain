class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.references :sale, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
