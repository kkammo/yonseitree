class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.string :name
      t.references :semester, index: true

      t.timestamps
    end

    # add_index :subjects, :semester_id
  end

  def down
  	drop_table :subjects
  end
end
