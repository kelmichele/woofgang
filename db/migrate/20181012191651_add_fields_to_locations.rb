class AddFieldsToLocations < ActiveRecord::Migration[5.2]
  def change
  	rename_column :locations, :street, :street_address_one
  	rename_column :locations, :suite, :street_address_two
  	add_column :locations, :store_name, :string
  	add_column :locations, :email, :string
  	add_column :locations, :hours, :string
  end
end
