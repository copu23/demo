class Hanghoa < ApplicationRecord
	belongs_to :vandon
	belongs_to :dichvu
	belongs_to :dichvucongthem
	has_many :comments, dependent: :destroy
	# belongs_to :nguoilap
	  belongs_to :state
end
