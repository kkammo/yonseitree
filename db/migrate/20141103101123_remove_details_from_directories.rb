class RemoveDetailsFromDirectories < ActiveRecord::Migration
  def change
    remove_column :directories, :is_terminal, :boolean
  end
end
