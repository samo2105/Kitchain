class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :size
      t.text :description

      t.timestamps
    end
  end
end
