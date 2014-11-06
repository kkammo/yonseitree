class Project < ActiveRecord::Base
	belongs_to :directory
	belongs_to :user
	belongs_to :directory_homework
	belongs_to :project
	has_many :projects
end
