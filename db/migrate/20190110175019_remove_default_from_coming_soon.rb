class RemoveDefaultFromComingSoon < ActiveRecord::Migration[5.2]
  def change
  	change_column :locations, :coming_soon, :boolean
  end
end
