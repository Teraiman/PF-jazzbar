class RemoveIntegerFromReserve < ActiveRecord::Migration[5.2]
  def change
    remove_column :reserves, :integer, :string
  end
end
