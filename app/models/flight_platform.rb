class FlightPlatform < ActiveRecord::Base
  attr_accessible :company_code, :name, :company_id, :platform_type
  validates_presence_of :platform_type
  validates_presence_of :name
  belongs_to :company
  has_many :sessions
  has_many :platform_batteries


	def flighttime
		time = 0
		sessions.each do |session|
			session.flights.each do |flight|
				time = time + flight.total_flight_time
			end
		end
		return time
	end

	def flightcount
		count = 0
		sessions.each do |session|
			count = count + session.flights.count
		end
		return count
	end

	def lastflightdate
	  	lastsession =  sessions.order("date ASC").last.date
	    return lastsession
  	end	

end