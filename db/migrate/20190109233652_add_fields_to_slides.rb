class AddFieldsToSlides < ActiveRecord::Migration[5.2]
  def change
  	add_column :slides, :order, :integer
  	add_column :slides, :display, :boolean
  	add_column :slides, :link, :string
  end
end
