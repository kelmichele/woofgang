class DropMediaRequests < ActiveRecord::Migration[5.2]
  def change
  	drop_table :media_requests
  end
end
