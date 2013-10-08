class AddFieldsToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :highpower, :boolean
    add_column :flights, :fullbatteryused, :boolean
  end
end
