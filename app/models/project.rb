class Project < ActiveRecord::Base
	belongs_to :directory
	belongs_to :user
end
