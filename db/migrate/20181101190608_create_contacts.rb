class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
    	t.string :name
    	t.string :email
    	t.string :phone
    	t.string :location
    	t.string :singup
    	t.string :grapevine
    	t.string :content
    	t.string :honey
  	  t.timestamps
    end
  end
end
