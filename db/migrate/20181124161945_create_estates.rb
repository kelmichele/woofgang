class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
    	t.string :company
    	t.string :first_name
    	t.string :last_name
    	t.string :address
    	t.string :address2
    	t.string :city
    	t.string :county
    	t.string :state
    	t.string :zip
    	t.string :email
    	t.string :phone
    	t.string :est_address
    	t.string :est_address2
    	t.string :est_city
    	t.string :est_county
    	t.string :est_state
    	t.string :est_zip
    	t.string :est_develop
    	t.string :est_footage
    	t.string :est_type
    	t.string :est_timeframe
    	t.string :grapevine

    	t.timestamps
    end
  end
end



