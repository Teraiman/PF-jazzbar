class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.integer :customer_id, null: false
      t.integer :schedule_id, null: false
      t.integer :count, null: false

      t.timestamps
    end
  end
end
