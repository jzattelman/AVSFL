class StaticPagesController < ApplicationController

before_filter :require_user

  def home
  end

  def welcome
  	@user_session = UserSession.new
  	if current_user
		redirect_to home_path
	end

  end

  def statistics
  	@batteries = current_user.company.batteries
  	@pilots = current_user.company.pilots
    @platforms = current_user.company.flight_platforms
  end

  def admin
    @company = current_user.company
    @user = current_user
  end

end
