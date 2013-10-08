class AddCompanyRefToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :company_id, :integer
    add_index :sessions, :company_id
  end
end
