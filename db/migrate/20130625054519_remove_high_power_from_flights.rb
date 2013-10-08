class RemoveHighPowerFromFlights < ActiveRecord::Migration
  def up
    remove_column :flights, :highpower
  end

  def down
    add_column :flights, :highpower, :boolean
  end
end
