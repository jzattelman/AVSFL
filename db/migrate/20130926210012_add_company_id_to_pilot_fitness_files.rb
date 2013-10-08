class AddCompanyIdToPilotFitnessFiles < ActiveRecord::Migration
  def change
    add_column :pilot_fitness_files, :company_id, :integer
    add_index :pilot_fitness_files, :company_id
  end
end
