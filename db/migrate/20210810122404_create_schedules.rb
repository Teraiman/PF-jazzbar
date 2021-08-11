class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.string :date, null: false
      t.string :time, null: false
      t.string :charge, null: false
      t.text :other

      t.timestamps
    end
  end
end
