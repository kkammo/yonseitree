class AddDesToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :project, index: true
  end
end
