class AddIncidentToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :incident, :boolean
  end
end
