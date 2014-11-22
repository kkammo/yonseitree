class AddCodefileToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :codefile, :string
  end
end
