class DirectoryClass < ActiveRecord::Base
  belongs_to :directory_semester
  has_many :directory_homeworks
end
