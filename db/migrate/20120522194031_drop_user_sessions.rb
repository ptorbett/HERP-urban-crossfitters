class DropUserSessions < ActiveRecord::Migration
  def change
    drop_table :user_sessions
  end
end
