class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :part_name, null: false

      t.timestamps
    end
  end
end
