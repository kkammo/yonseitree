class DirectoryHomework < ActiveRecord::Base
	belongs_to :directory_class
	has_many :projects
end
