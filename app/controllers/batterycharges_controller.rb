class BatterychargesController < ApplicationController

  before_filter :require_user

  # GET /batterycharges
  # GET /batterycharges.json
  def index
    @batterycharges = current_user.company.batterycharges

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batterycharges }
    end
  end

  # GET /batterycharges/1
  # GET /batterycharges/1.json
  def show
    @batterycharge = Batterycharge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @batterycharge }
    end
  end

  # GET /batterycharges/new
  # GET /batterycharges/new.json
  def new
    @batterycharge = Batterycharge.new
    @batteries = current_user.company.batteries

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batterycharge }
    end
  end

  # GET /batterycharges/1/edit
  def edit
    @batterycharge = Batterycharge.find(params[:id])
    @batteries = current_user.company.batteries
  end

  # POST /batterycharges
  # POST /batterycharges.json
  def create
    @batterycharge = Batterycharge.new(params[:batterycharge])
    @batterycharge.company = current_user.company

    respond_to do |format|
      if @batterycharge.save
        format.html { redirect_to @batterycharge, notice: 'Batterycharge was successfully created.' }
        format.json { render json: @batterycharge, status: :created, location: @batterycharge }
      else
        format.html { render action: "new" }
        format.json { render json: @batterycharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /batterycharges/1
  # PUT /batterycharges/1.json
  def update
    @batterycharge = Batterycharge.find(params[:id])

    respond_to do |format|
      if @batterycharge.update_attributes(params[:batterycharge])
        format.html { redirect_to @batterycharge, notice: 'Batterycharge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batterycharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batterycharges/1
  # DELETE /batterycharges/1.json
  def destroy
    @batterycharge = Batterycharge.find(params[:id])
    @batterycharge.destroy

    respond_to do |format|
      format.html { redirect_to batterycharges_url }
      format.json { head :no_content }
    end
  end
end
