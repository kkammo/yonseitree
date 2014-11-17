class Semester < ActiveRecord::Base
	validates :name, :presence => true,
		:format => { with: /\A20[0-9]{2}\-[1-2]\Z/ }

	has_many :subjects
end
