class CreateHomeworks < ActiveRecord::Migration
  def up
    create_table :homeworks do |t|
      t.string :name
      t.references :subject, index: true

      t.timestamps
    end

    # add_index :homeworks, :subject_id
  end

  def down
  	drop_table :homeworks
  end
end
