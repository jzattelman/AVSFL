class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.string :code
      t.date :new_date

      t.timestamps
    end
  end
end
