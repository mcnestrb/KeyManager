class ChangeGroupMemsToGroupUsers < ActiveRecord::Migration
  def change
  	rename_table :group_mems, :group_users
  end
end
