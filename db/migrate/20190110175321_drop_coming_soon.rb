class DropComingSoon < ActiveRecord::Migration[5.2]
  def change
  	remove_column :locations, :coming_soon, :boolean
  end
end
