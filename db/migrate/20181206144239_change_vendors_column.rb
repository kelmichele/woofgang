class ChangeVendorsColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :vendors, :big_box, :string
  end
end
