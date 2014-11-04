class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :directory_homework, index: true
  end
end
