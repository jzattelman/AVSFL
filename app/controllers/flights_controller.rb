class FlightsController < ApplicationController

  before_filter :require_user
  
  # GET /flights
  # GET /flights.json
  def index
    @session = Session.find(params[:session_id])
    @flights = @session.flights

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flights }
    end
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    session = Session.find(params[:session_id])
    @flight = session.flights.find(params[:id])
    @battery = Battery.find(@flight.battery_id)

    respond_to do |format|
      format.html { render layout: !request.xhr? } # show.html.erb
      format.json { render json: @flight }
      format.js   {}
    end
  end

  # GET /flights/new
  # GET /flights/new.json
  def new
    session = Session.find(params[:session_id])
    @flight = session.flights.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flight }
    end
  end

  # GET /flights/1/edit
  def edit
    session = Session.find(params[:session_id])
    @flight = session.flights.find(params[:id])
  end

  # session /flights
  # session /flights.json
  def create
    @session = Session.find(params[:session_id])
    @flight = @session.flights.create(params[:flight])

    respond_to do |format|
      if @flight.save
        if @flight.isincident == true
          incident = Incident.new
          incident.incident_date = @flight.session.date
          incident.location = @flight.session.location
          incident.flight_id = @flight.id
          incident.company = current_user.company
          incident.save
        end
        @flights = @session.flights
        format.html { redirect_to([@flight.session], :notice => 'Flight was successfully created.') }
        format.xml  { render :xml => @flight, :status => :created, :location => [@flight.session, @flight] }
        format.js {}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flight.errors, :status => :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /flights/1
  # PUT /flights/1.json
  def update
    session = Session.find(params[:session_id])
    @flight = session.flights.find(params[:id])

    if params[:flight][:isincident] == "1" && @flight.incident.nil?
      incident = Incident.new
      incident.incident_date = @flight.session.date
      incident.location = @flight.session.location
      incident.flight_id = @flight.id
      incident.company = current_user.company
      incident.save
    end

    start_hour = @flight.spin_up_time.hour
    start_min = @flight.spin_up_time.min
    start_sec = @flight.spin_up_time.sec

    end_hour = @flight.spin_down_time.hour
    end_min = @flight.spin_down_time.min
    end_sec = @flight.spin_down_time.sec

    total_hour = end_hour - start_hour
    total_min = end_min - start_min
    total_sec = end_sec - start_sec

    @flight.total_flight_time = total_hour + (total_min / 60.0) + (total_sec / 3600)

    respond_to do |format|
      if @flight.update_attributes(params[:flight])
        @session = @flight.session
        format.html { redirect_to([@flight.session], :notice => 'flight was successfully updated.') }
        format.xml  { head :ok }
        format.js{}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @session = Session.find(params[:session_id])
    @flight = @session.flights.find(params[:id])
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to (session_flights_url) }
      format.json { head :no_content }
      format.js{}
    end
  end

end
