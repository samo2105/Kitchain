class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :worker, foreign_key: true
      t.integer :total
      t.boolean :payed, default: false
      t.text :comment
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
