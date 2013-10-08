class AddPilotToPilotFitnessFiles < ActiveRecord::Migration
  def change
    add_column :pilot_fitness_files, :pilot_id, :integer
    add_column :pilot_fitness_files, :date, :date
  end
end
