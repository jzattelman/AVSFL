class LogMailer < ActionMailer::Base
  default from: "admin@flightlog.com.au"

	def mission_chief_email(session)
		@session = session
		@pilot = Pilot.find(@session.remote_pilot_id)
		@platform = FlightPlatform.find(@session.flight_platform_id)
		mail(to:"justin@aerialvisionservices.com.au", subject: "Flight log - Mission created")
	end
end
