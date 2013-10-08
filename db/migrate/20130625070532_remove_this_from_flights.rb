class RemoveThisFromFlights < ActiveRecord::Migration
  def up
    remove_column :flights, :incident
  end

  def down
    add_column :flights, :incident, :boolean
  end
end
