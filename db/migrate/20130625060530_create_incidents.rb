class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.date :report_date
      t.string :reporter_name
      t.boolean :personal_injury
      t.boolean :equipment_damage
      t.boolean :thirdparty_damage
      t.string :witness_names
      t.time :incident_time
      t.boolean :casa_notified
      t.boolean :chief_pilot_notified
      t.boolean :management_notified
      t.boolean :atrb_notified
      t.boolean :worksafe_notified
      t.boolean :insurance_notified
      t.text :description
      t.text :consequences
      t.text :action_taken

      t.timestamps
    end
  end
end
