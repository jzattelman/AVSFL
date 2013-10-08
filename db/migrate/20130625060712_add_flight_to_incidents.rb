class AddFlightToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :flight_id, :integer
  end
end
