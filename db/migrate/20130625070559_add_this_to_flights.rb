class AddThisToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :isincident, :boolean
  end
end
