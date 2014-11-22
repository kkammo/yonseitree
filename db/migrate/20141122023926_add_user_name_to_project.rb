class AddUserNameToProject < ActiveRecord::Migration
  def change
    add_column :projects, :user_name, :string
  end
end
