class Batterycharge < ActiveRecord::Base
  attr_accessible :date, :end_percentage, :end_voltage, :start_voltage_decimal, :status, :battery_id
  belongs_to :battery
  belongs_to :company
end
