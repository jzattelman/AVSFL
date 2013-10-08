class Incident < ActiveRecord::Base
  attr_accessible :action_taken, :atrb_notified, :casa_notified, :chief_pilot_notified, :consequences, :description, :equipment_damage, :incident_time, :insurance_notified, :management_notified, :personal_injury, :report_date, :reporter_name, :thirdparty_damage, :witness_names, :worksafe_notified, :flight_id, :report_date, :location, :incident_date
  belongs_to :flight
  belongs_to :company

end
