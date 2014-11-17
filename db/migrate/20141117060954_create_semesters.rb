class CreateSemesters < ActiveRecord::Migration
  def up
    create_table :semesters do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
  	drop_table :semesters
  end
end
