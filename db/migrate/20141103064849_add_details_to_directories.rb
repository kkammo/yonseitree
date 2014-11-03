class AddDetailsToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :directory_type, :string
  end
end
