class AddOthersToEstates < ActiveRecord::Migration[5.2]
  def change
		add_column :estates, :other, :string
		add_column :estates, :source, :string
  end
end
