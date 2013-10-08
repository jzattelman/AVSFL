class AddAddressToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :address, :string
  end
end
