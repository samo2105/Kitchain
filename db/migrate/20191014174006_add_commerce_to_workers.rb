class AddCommerceToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_reference :workers, :commerce, foreign_key: true
  end
end
