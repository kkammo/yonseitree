class CreateDirectoryHomeworks < ActiveRecord::Migration
  def change
    create_table :directory_homeworks do |t|
      t.string :class_name
      t.references :directory_class, index: true

      t.timestamps
    end
  end
end
