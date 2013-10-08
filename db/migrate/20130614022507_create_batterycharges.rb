class CreateBatterycharges < ActiveRecord::Migration
  def change
    create_table :batterycharges do |t|
      t.date :date
      t.string :status
      t.string :start_voltage_decimal
      t.decimal :end_voltage
      t.decimal :end_percentage
      t.references :battery

      t.timestamps
    end
    add_index :batterycharges, :battery_id
  end
end
