class AddFlighTimeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :total_flight_time, :decimal
  end
end
