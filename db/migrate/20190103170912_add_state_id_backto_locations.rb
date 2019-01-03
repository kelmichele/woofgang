class AddStateIdBacktoLocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations, :state_id, :integer
  end
end
