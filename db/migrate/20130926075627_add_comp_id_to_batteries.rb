class AddCompIdToBatteries < ActiveRecord::Migration
  def change
    add_column :batteries, :company_id, :integer
    add_index :batteries, :company_id
  end
end
