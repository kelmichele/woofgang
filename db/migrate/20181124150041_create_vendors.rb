class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
    	t.string :name
    	t.string :company
    	t.string :email
    	t.string :phone
    	t.string :product
			t.string :honey
		  t.timestamps
    end
  end
end
