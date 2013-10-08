class AddCompanyIdToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :company_id, :integer
    add_index :pilots, :company_id
  end
end
