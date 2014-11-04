class CreateDirectoryClasses < ActiveRecord::Migration
  def change
    create_table :directory_classes do |t|
      t.string :class_name
      t.references :directory_semester, index: true

      t.timestamps
    end
  end
end
