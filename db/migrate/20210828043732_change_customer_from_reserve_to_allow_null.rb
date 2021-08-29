class ChangeCustomerFromReserveToAllowNull < ActiveRecord::Migration[5.2]

  def up
    change_column :reserves, :customer_id, :integer, null: true
  end

  def down
    change_column :reserves, :customer_id, :integer, null: false
  end
end
