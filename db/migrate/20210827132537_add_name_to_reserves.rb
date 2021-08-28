class AddNameToReserves < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :name, :string
  end
end
