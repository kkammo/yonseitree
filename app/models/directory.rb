class Directory < ActiveRecord::Base
	has_many :projects
	has_many :directories
end
