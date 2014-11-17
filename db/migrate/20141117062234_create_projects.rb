class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :homework, index: true

      t.timestamps
    end
  end

  def down
  	drop_table :projects
  end
end
