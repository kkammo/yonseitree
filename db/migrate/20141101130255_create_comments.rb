class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
