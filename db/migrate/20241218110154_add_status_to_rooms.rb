class AddStatusToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :status, :string,default: "available"
  end
end
