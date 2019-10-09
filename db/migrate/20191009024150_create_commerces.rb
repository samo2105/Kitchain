class CreateCommerces < ActiveRecord::Migration[5.2]
  def change
    create_table :commerces do |t|
      t.string :name
      t.string :adress
      t.integer :number
      t.integer :rol

      t.timestamps
    end
  end
end
