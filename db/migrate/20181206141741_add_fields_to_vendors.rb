class AddFieldsToVendors < ActiveRecord::Migration[5.2]
  def change
  	add_column :vendors, :address, :string
  	add_column :vendors, :website, :string
  	add_column :vendors, :category, :string
  	add_column :vendors, :big_box, :boolean
  	add_column :vendors, :order_min, :string
  	add_column :vendors, :wholesale_price, :string
  	add_column :vendors, :source, :string
  	add_column :vendors, :shipping, :string
  	add_column :vendors, :msrp, :string
  end
end
