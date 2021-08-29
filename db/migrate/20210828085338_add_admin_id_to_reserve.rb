class AddAdminIdToReserve < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :admin_id, :string
    add_column :reserves, :integer, :string
  end
end
