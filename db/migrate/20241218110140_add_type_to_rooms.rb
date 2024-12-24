class AddTypeToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :Type, :string,default: "single"
  end
end
