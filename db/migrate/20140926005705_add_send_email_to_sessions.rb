class AddSendEmailToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :send_email, :boolean
  end
end
