class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
    	t.string :street
    	t.string :suite
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :phone
    	t.timestamps
    end

    add_index :locations, :city
    add_index :locations, :state
    add_index :locations, :zip
  end
end
