class CreatePilotFitnessFiles < ActiveRecord::Migration
  def change
    create_table :pilot_fitness_files do |t|
      t.boolean :q1
      t.boolean :q2
      t.boolean :q3
      t.boolean :q4
      t.boolean :q5
      t.boolean :q6
      t.boolean :q7
      t.boolean :q8
      t.boolean :q9
      t.boolean :q10
      t.boolean :q11
      t.boolean :q12
      t.boolean :q13
      t.boolean :q14

      t.timestamps
    end
  end
end
