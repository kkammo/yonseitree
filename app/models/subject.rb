class Subject < ActiveRecord::Base
  belongs_to :semester
  has_many :homeworks

  validates :name, :presence => true
  validates :semester_id, :presence => true
end
