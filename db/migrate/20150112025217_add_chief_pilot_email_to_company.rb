class AddChiefPilotEmailToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :chiefPilotEmail, :string
  end
end
