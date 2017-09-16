class Vandon < ApplicationRecord
	has_many :hanghoas, dependent: :delete_all
	belongs_to :nguoilap, class_name: "User"
	has_many :khachhangs, dependent: :delete_all
	has_many :nguoinhans, dependent: :delete_all
	# belongs_to :nguoinhan
	has_many :comments, dependent: :destroy
end