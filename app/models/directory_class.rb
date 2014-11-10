class DirectoryClass < ActiveRecord::Base
  belongs_to :directory_semester
  has_many :directory_homeworks

  accepts_nested_attributes_for :directory_semester
end
