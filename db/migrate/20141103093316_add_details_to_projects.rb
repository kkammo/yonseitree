class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :directory, index: true
  end
end
