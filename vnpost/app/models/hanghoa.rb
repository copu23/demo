class Hanghoa < ApplicationRecord
	belongs_to :vandon
	  belongs_to :state
	has_many :comments, dependent: :destroy
end
