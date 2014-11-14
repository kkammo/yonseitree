class AddTaToDirectoryHomeworks < ActiveRecord::Migration
  def change
    add_reference :directory_homeworks, :user, index: true
  end
end
