class State < ApplicationRecord
	has_many :hannghoas
	has_many :comments,  dependent: :destroy
	has_many :vandons

	def to_s
		name
	end
end
