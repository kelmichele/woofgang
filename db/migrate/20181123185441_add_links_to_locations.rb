class AddLinksToLocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations, :fb, :string
  	add_column :locations, :twitter, :string
  	add_column :locations, :insta, :string
  	add_column :locations, :site, :string
  end
end
