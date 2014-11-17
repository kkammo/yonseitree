class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.text :content

      t.timestamps
    end
    # add_index (:comments, [:user_id, :project_id])
  end

  def down
  	drop_down :comments
  end
end
