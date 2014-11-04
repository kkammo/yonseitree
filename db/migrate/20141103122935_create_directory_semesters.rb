class CreateDirectorySemesters < ActiveRecord::Migration
  def change
    create_table :directory_semesters do |t|
      t.string :semester_name

      t.timestamps
    end
  end
end
