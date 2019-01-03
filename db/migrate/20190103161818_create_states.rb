class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
    	t.string :name
    	t.string :full_name
	  	t.string :slug
    	t.timestamps
    end

  	add_index :states, :id
  	add_index :states, :name
  	add_index :states, :full_name
  	add_index :states, :slug
  end
end
