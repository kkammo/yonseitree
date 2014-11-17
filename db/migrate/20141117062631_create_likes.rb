class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
    # add_index(:likes, [:user_id, :project_id])
  end

  def down
  	drop_table :likes
  end
end
