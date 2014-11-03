class AddUserIdFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :student_id, :string, null: false, default: ""
    add_index :users, :student_id,              unique: true
  end
end
