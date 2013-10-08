class AddFlightPLatformIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :flight_platform_id, :integer
    add_index :sessions, :flight_platform_id
  end
end
