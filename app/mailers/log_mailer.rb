class LogMailer < ActionMailer::Base
  default from: "flightlog@aerialvisionservices.com"

	def mission_chief_email(mission)
		@mission = mission
		@pilot = @mission.remote_pilot
		mail(to:"justin@aerialvisionservices.com.au", subject: "Flight log - Mission created")
	end
end
