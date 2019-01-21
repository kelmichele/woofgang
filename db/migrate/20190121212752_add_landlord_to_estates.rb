class AddLandlordToEstates < ActiveRecord::Migration[5.2]
  def change
  	add_column :estates, :landlord, :string
  end
end
