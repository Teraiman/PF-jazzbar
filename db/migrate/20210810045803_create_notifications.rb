class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :customer_id, null: false
      t.integer :artist_id, null: false
      t.boolean :already_read, null: false, default: false

      t.timestamps
    end
  end
end
