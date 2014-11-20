class AddParentToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :project, index: true
  end
end
