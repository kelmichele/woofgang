class DeleteShopsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :shops
  end
end
