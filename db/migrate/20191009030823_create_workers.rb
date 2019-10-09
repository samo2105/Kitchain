class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.references :office, foreign_key: true
      t.string :name
      t.integer :rol
      t.string :adress
      t.integer :number
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
