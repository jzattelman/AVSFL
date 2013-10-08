class CreateFlightPlatforms < ActiveRecord::Migration
  def change
    create_table :flight_platforms do |t|
      t.string :name
      t.integer :company_code
      t.timestamps
    end
  end
end
