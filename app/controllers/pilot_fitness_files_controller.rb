class PilotFitnessFilesController < ApplicationController

  before_filter :require_user
  
  # GET /pilot_fitness_files
  # GET /pilot_fitness_files.json
  def index
    @pilot_fitness_files = current_user.company.pilot_fitness_files

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pilot_fitness_files }
    end
  end

  # GET /pilot_fitness_files/1
  # GET /pilot_fitness_files/1.json
  def show
    @pilot_fitness_file = PilotFitnessFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pilot_fitness_file }
    end
  end

  # GET /pilot_fitness_files/new
  # GET /pilot_fitness_files/new.json
  def new
    @pilot_fitness_file = PilotFitnessFile.new
    @pilot_fitness_file.company = current_user.company

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pilot_fitness_file }
    end
  end

  # GET /pilot_fitness_files/1/edit
  def edit
    @pilot_fitness_file = PilotFitnessFile.find(params[:id])
  end

  # POST /pilot_fitness_files
  # POST /pilot_fitness_files.json
  def create
    @pilot_fitness_file = PilotFitnessFile.new(params[:pilot_fitness_file])
    @pilot_fitness_file.company_id = current_user.company_id

    respond_to do |format|
      if @pilot_fitness_file.save
        format.html { redirect_to @pilot_fitness_file, notice: 'Pilot fitness file was successfully created.' }
        format.json { render json: @pilot_fitness_file, status: :created, location: @pilot_fitness_file }
      else
        format.html { render action: "new" }
        format.json { render json: @pilot_fitness_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pilot_fitness_files/1
  # PUT /pilot_fitness_files/1.json
  def update
    @pilot_fitness_file = PilotFitnessFile.find(params[:id])

    respond_to do |format|
      if @pilot_fitness_file.update_attributes(params[:pilot_fitness_file])
        format.html { redirect_to @pilot_fitness_file, notice: 'Pilot fitness file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pilot_fitness_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pilot_fitness_files/1
  # DELETE /pilot_fitness_files/1.json
  def destroy
    @pilot_fitness_file = PilotFitnessFile.find(params[:id])
    @pilot_fitness_file.destroy

    respond_to do |format|
      format.html { redirect_to pilot_fitness_files_url }
      format.json { head :no_content }
    end
  end
end
