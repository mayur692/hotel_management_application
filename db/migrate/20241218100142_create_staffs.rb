class CreateStaffs < ActiveRecord::Migration[7.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :work
      t.integer :salary
      t.integer :contact
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
