class Comment < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :content, :presence => true
end
