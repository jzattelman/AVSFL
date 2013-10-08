class SessionsController < ApplicationController

  before_filter :require_user

  # GET /sessions
  # GET /sessions.json
  def index
    user = current_user
    company = user.company
    @sessions = company.sessions

    respond_to do |format|
      format.html # index.html.erb
      format.json { 
        render :json => @sessions.to_json(only: [:id, :date, :client, :longitude,:latitude]) 
      }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])
    @remote_pilot = Pilot.find(@session.remote_pilot_id)
    @chief_pilot = Pilot.find(@session.chief_pilot_id)
    fitnessfiles = PilotFitnessFile.where("pilot_id = ? AND date = ?", @session.remote_pilot_id, @session.date)
    if fitnessfiles.count > 0
      if fitnessfiles.first.pass == true
        @healthfile = "pass"
      else
        @healthfile = "fail"
      end
    else
      @healthfile = "missing"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(params[:session])
    @session.chief_pilot_type = "Pilot"
    @session.remote_pilot_type = "Pilot"
    @session.company_id = current_user.company_id
    @newsession = Session.new

    respond_to do |format|
      if @session.save
        @sessions = Session.all
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])
    @newsession = Session.new

    respond_to do |format|
      if @session.update_attributes(params[:session])
        @sessions = Session.all
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session = Session.find(params[:id])
    session.destroy
    @sessions = Session.all

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
      format.js
    end
  end
end
