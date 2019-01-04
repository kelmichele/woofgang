class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
    	t.string :store_name
			t.string :street_address_one
    	t.string :street_address_two
    	t.string :city
    	t.integer :state_id
    	t.string :og_state
    	t.string :zip
    	t.string :phone
    	t.string :email_address
    	t.string :hours
    	t.string :slug
    	t.string :fb
    	t.string :twitter
    	t.string :insta
    	t.string :site
    	t.string :image
    	t.string :yelp
    	t.float :latitude
    	t.float :longitude
    	t.timestamps
    end

    add_index :stores, :city
	  add_index :stores, :og_state
	  add_index :stores, :state_id
	  add_index :stores, :zip
  end
end
