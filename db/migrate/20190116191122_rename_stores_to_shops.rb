class RenameStoresToShops < ActiveRecord::Migration[5.2]
  def change
  	rename_table :stores, :shops
  end
end
