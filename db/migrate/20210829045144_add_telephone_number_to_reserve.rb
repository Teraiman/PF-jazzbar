class AddTelephoneNumberToReserve < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :telephone_number, :integer
    change_column :reserves, :admin_id, :integer
  end
end
