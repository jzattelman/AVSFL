class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :battery_start_reading
      t.time :spin_up_time
      t.time :spin_down_time
      t.integer :total_flight_time
      t.references :battery
      t.references :session

      t.timestamps
    end
    add_index :flights, :battery_id
    add_index :flights, :session_id
  end
end
