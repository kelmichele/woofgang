class ReCreateMedias < ActiveRecord::Migration[5.2]
  def change
  	create_table :medias do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :phone
    	t.string :outlet
    	t.string :deadline
    	t.string :question
    	t.string :honey

  	  t.timestamps
    end
  end
end
