class State < ApplicationRecord
	has_many :hannghoas
	has_many :comments
	has_many :vandons

	def to_s
		name
	end
end
