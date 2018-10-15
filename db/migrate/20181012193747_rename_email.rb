class RenameEmail < ActiveRecord::Migration[5.2]
  def change
  	rename_column :locations, :email, :email_address
  end
end
