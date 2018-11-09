class AddDisplayNamesToTags < ActiveRecord::Migration[5.2]
  def change
  	add_column :tags, :display_name, :string
  end
end
