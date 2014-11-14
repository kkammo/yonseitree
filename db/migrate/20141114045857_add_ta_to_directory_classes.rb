class AddTaToDirectoryClasses < ActiveRecord::Migration
  def change
    add_reference :directory_classes, :user, index: true
  end
end
