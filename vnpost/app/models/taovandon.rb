class Taovandon < ApplicationRecord
	
	
	validates :hotenkh, presence:{message: "Họ tên không được để trống"}
	validates :noinhan, presence:{message: "Nơi nhận không được để trống"}
	# validates :sdt, presence: true , format: { with: /\d{3}-\d{3}-\d{5}/, message: "Số điện thoại có 10 hoặc 11 số" }
	validates :sdt,   :presence => {:message => 'SĐT không được trống'},
		             numericality:{message: "Chỉ chứa kí tự số từ 0 đến 9"},
		              :length => { :minimum => 10, :maximum => 11}
end
