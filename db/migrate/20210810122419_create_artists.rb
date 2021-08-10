class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :part_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
