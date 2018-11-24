class DropMediasTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :medias
  end
end
