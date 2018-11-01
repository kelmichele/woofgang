class AddHoneyToCandidates < ActiveRecord::Migration[5.2]
  def change
  	add_column :candidates, :honey, :string
  end
end
