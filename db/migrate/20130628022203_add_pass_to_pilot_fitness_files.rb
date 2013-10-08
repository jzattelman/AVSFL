class AddPassToPilotFitnessFiles < ActiveRecord::Migration
  def change
    add_column :pilot_fitness_files, :pass, :boolean
  end
end
