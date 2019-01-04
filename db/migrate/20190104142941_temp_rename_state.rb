class TempRenameState < ActiveRecord::Migration[5.2]
  def change
  	rename_column :locations, :state, :og_state
  	add_index :locations, :state_id
  end
end
