class AddOfficeToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :tables, :office, foreign_key: true
  end
end
