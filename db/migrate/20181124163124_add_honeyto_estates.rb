class AddHoneytoEstates < ActiveRecord::Migration[5.2]
  def change
		add_column :estates, :honey, :string
  end
end
