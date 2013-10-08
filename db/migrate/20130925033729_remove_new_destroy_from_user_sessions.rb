class RemoveNewDestroyFromUserSessions < ActiveRecord::Migration
  def up
    remove_column :user_sessions, :new
    remove_column :user_sessions, :destroy
  end

  def down
    add_column :user_sessions, :destroy, :string
    add_column :user_sessions, :new, :string
  end
end
