class Project < ActiveRecord::Base
	belongs_to :directory
	belongs_to :user
	belongs_to :directory_homework
	belongs_to :project
	has_many :projects

	def self.search(query)
	    # where(:title, query) -> This would return an exact match of the query
	    where("project_name like ?", "%#{query}%")
	end
end
