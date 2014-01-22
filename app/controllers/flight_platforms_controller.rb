class FlightPlatformsController < ApplicationController
  # GET /flight_platforms
  # GET /flight_platforms.json
  def addbattery
    flight_platform = FlightPlatform.find(params[:flight_platform_id])
    battery = Battery.find(params[:battery_id])
    flight_platform.addbattery(battery)
  end

  def index
    @flight_platforms = FlightPlatform.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flight_platforms }
    end
  end

  # GET /flight_platforms/1
  # GET /flight_platforms/1.json
  def show
    @flight_platform = FlightPlatform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flight_platform }
    end
  end

  # GET /flight_platforms/new
  # GET /flight_platforms/new.json
  def new
    @flight_platform = FlightPlatform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flight_platform }
    end
  end

  # GET /flight_platforms/1/edit
  def edit
    @flight_platform = FlightPlatform.find(params[:id])
  end

  # POST /flight_platforms
  # POST /flight_platforms.json
  def create
    @flight_platform = FlightPlatform.new(params[:flight_platform])

    respond_to do |format|
      if @flight_platform.save
        format.html { redirect_to @flight_platform, notice: 'Flight platform was successfully created.' }
        format.json { render json: @flight_platform, status: :created, location: @flight_platform }
      else
        format.html { render action: "new" }
        format.json { render json: @flight_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flight_platforms/1
  # PUT /flight_platforms/1.json
  def update
    @flight_platform = FlightPlatform.find(params[:id])

    respond_to do |format|
      if @flight_platform.update_attributes(params[:flight_platform])
        format.html { redirect_to @flight_platform, notice: 'Flight platform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flight_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_platforms/1
  # DELETE /flight_platforms/1.json
  def destroy
    @flight_platform = FlightPlatform.find(params[:id])
    @flight_platform.destroy

    respond_to do |format|
      format.html { redirect_to flight_platforms_url }
      format.json { head :no_content }
    end
  end
end
