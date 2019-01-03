class DropStateId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :locations, :state_id, :string
  end
end
