class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
    	t.string :name
    	t.string :email
    	t.string :phone
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :experience
    	t.string :background
    	t.string :preferred_state
    	t.string :preferred_city
    	t.string :cash
    	t.string :time_frame
  	  t.timestamps
    end
  end
end
