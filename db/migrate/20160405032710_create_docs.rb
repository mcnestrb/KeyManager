class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :name
      t.string :file_path
      t.integer :group_id
      t.string :file_type

      t.timestamps null: false
    end
  end
end
