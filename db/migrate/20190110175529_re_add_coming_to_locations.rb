class ReAddComingToLocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations, :coming_soon, :boolean
  end
end
