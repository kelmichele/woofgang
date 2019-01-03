class AddStateIdToLocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations, :state_id, :string
  end
end
