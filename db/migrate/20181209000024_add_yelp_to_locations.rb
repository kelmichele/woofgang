class AddYelpToLocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations, :yelp, :string
  end
end
