class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.references :commerce, foreign_key: true
      t.string :name
      t.string :adress
      t.string :number

      t.timestamps
    end
  end
end
