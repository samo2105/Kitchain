class AddOfficeidToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_reference :workers, :office
  end
end
