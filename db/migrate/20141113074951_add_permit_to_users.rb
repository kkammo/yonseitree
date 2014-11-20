class AddPermitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permit, :boolean, default: false
  end
end
