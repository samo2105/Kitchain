class RemoveOfficeidFromWorkers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :workers, :office, foreign_key: true
  end
end
