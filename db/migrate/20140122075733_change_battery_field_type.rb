class ChangeBatteryFieldType < ActiveRecord::Migration
   def up
  	change_column :flights, :battery_start_reading, :decimal
  end

  def down
  	change_column :flights, :battery_start_reading, :integer
  end
end
