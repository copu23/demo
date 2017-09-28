class State < ApplicationRecord
	has_many :hannghoas
	has_many :comments

	def to_s
		name
	end
end
