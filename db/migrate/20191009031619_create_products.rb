class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :quantity
      t.string :price
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
