class Project < ActiveRecord::Base
	belongs_to :directory_homework

	accepts_nested_attributes_for :directory_homework

	belongs_to :user
	has_many :comments, :dependent => :destroy
	has_many :likes, :dependent => :destroy
	belongs_to :project
	has_many :projects

	public	
		def self.search(query)
		    # where(:title, query) -> This would return an exact match of the query
		    where("project_name like ?", "%#{query}%")
		end

		def parent_id
			self.project_id
		end

		def is_root
			parent_id.nil?
		end

		def is_editable(current_user)
			current_user.id == self.user_id and Project.where(:project_id => self.id).all.count == 0
		end
end
