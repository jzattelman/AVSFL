class AddWindToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :windspeed, :decimal
  end
end
