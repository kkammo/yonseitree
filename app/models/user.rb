class User < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.){1,2}+[a-z]{2,})\Z/i, on: :create }
	validates :student_id, :presence => true, :length => { :minimum => 8, :maximum => 10 }
end
