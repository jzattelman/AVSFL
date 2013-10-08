class AddStuffToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :date, :date
    add_column :incidents, :location, :string
  end
end
