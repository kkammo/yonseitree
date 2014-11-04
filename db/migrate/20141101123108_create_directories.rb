class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :directory_name
      t.boolean :is_terminal

      t.timestamps
    end
  end
end
