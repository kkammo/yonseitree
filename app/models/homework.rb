class Homework < ActiveRecord::Base
  belongs_to :subject
  has_many :projects

  validates :name, :presence => true
  validates :subject_id, :presence => true
end
