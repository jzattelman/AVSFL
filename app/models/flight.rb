class Flight < ActiveRecord::Base
  attr_accessible :battery_start_reading, :spin_down_time, :spin_up_time, :total_flight_time, :battery_id, :session_id, :fullbatteryused, :isincident, :windspeed
  before_save :flighttimecalc
  #after_create :createincident

  validates_presence_of :battery_id, :message => "must be selected"
  validates_presence_of :battery_start_reading
  validates_presence_of :windspeed

  belongs_to :battery
  belongs_to :session
  has_one :incident, :dependent => :destroy

  private

  def flighttimecalc
  	start_hour = self.spin_up_time.hour
    start_min = self.spin_up_time.min
    start_sec = self.spin_up_time.sec

    end_hour = self.spin_down_time.hour
    end_min = self.spin_down_time.min
    end_sec = self.spin_down_time.sec

    total_hour = end_hour - start_hour
    total_min = end_min - start_min
    total_sec = end_sec - start_sec

    self.total_flight_time = total_hour + (total_min / 60.0) + (total_sec / 3600.0)
    Rails.logger.debug "*"*120
    Rails.logger.debug total_flight_time
    Rails.logger.debug "*"*120
  end

  def createincident
  	if self.isincident == true
		incident = Incident.new
		incident.incident_date = self.session.date
		incident.location = self.session.location
		incident.flight_id = self.id
    incident.company = @csd
		incident.save
  	end
  end
end
