class RemoveFlightTimeFromFlights < ActiveRecord::Migration
  def up
    remove_column :flights, :total_flight_time
  end

  def down
    add_column :flights, :total_flight_time, :integer
  end
end
