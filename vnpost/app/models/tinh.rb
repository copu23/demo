class Tinh < ApplicationRecord
	belongs_to :vung
	has_many :nguoinhans
	validates :tentinh, presence: {message: "Vui lòng nhập tên tỉnh "}, uniqueness: {message: " Đã tồn tại"}
end
