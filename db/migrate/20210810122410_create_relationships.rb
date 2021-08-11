class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :artist_id, null: false
      t.integer :schedule_id, null: false

      t.timestamps
    end
  end
end
