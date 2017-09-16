class Tinh < ApplicationRecord
	belongs_to :vung
	has_many :nguoinhans
end
