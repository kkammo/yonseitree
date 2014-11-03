class Directory < ActiveRecord::Base
	has_many :directories, :projects
end
