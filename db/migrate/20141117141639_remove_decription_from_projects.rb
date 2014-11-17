class RemoveDecriptionFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :decription, :text
  end
end
