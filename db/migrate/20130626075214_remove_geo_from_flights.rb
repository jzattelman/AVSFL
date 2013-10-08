class RemoveGeoFromFlights < ActiveRecord::Migration
  def up
    remove_column :flights, :latitude
    remove_column :flights, :longitude
  end

  def down
    add_column :flights, :longitude, :float
    add_column :flights, :latitude, :float
  end
end
