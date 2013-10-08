class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :date
      t.string :location
      t.string :client
      t.text :task
      t.string :weather
      t.integer :windspeed
      t.references :remote_pilot, :polymorphic =>true
      t.references :chief_pilot, :polymorphic =>true
      t.string :observer
      t.string :payload
      t.string :gcs_deployment
      t.string :gcs_control
      t.time :jsa_time
      t.time :pre_flight_time
      t.time :mission_briefing_time

      t.timestamps
    end
  end
end
