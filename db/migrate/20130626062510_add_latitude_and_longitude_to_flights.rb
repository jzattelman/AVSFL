class AddLatitudeAndLongitudeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :latitude, :float
    add_column :flights, :longitude, :float
  end
end
