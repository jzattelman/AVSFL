class AddCompanyIdToBatterycharges < ActiveRecord::Migration
  def change
    add_column :batterycharges, :company_id, :integer
    add_index :batterycharges, :company_id
  end
end
