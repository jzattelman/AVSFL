class AddDateToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :incident_date, :date
  end
end
