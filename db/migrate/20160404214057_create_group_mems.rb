class CreateGroupMems < ActiveRecord::Migration
  def change
    create_table :group_mems do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
