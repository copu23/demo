class Mucphithuho < ApplicationRecord
	
	validates :tenmp, presence: {message: "Vui lòng nhập mức phí "}, uniqueness: {message: " Đã tồn tại"}
	validates :gtbd, presence: {message: "Vui lòng nhập gía trị bắt đầu"}
	validates :gtkt, presence: {message: "Vui lòng nhập gía trị kết thúc"}
	validates :mucphi, presence: {message: "Vui lòng nhập gía trị mức phí"}



end
