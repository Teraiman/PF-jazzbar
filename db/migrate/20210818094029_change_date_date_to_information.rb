class ChangeDateDateToInformation < ActiveRecord::Migration[5.2]
  def change
    change_column :information, :date, :date
  end
end
