class Project < ActiveRecord::Base
  belongs_to :homework
  belongs_to :project
  has_many :projects

  validates :name, :presence => true
  validates :homework_id, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true

  def parent_id
  	self.project_id
  end
end
