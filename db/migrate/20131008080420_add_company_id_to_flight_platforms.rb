class AddCompanyIdToFlightPlatforms < ActiveRecord::Migration
  def change
    add_column :flight_platforms, :company_id, :integer
    add_index :flight_platforms, :company_id
  end
end
