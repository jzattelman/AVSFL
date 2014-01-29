class AddTypeToFlightPlatform < ActiveRecord::Migration
  def change
    add_column :flight_platforms, :platform_type, :string
  end
end
