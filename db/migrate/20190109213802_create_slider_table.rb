class CreateSliderTable < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
	  	t.string :image
	  	t.string :title
			t.timestamps
    end
  end
end
