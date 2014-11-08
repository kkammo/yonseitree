class Project < ActiveRecord::Base
	belongs_to :directory_homework
	belongs_to :user
	has_many :comments, :dependent => :destroy
	has_many :likes, :dependent => :destroy
	belongs_to :project
	has_many :projects
	
	def self.search(query)
	    # where(:title, query) -> This would return an exact match of the query
	    where("project_name like ?", "%#{query}%")
	end
end
