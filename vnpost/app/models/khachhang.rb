class Khachhang < ApplicationRecord
	belongs_to :vandon
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
		obj.city    = geo.city
	    obj.province    = geo.province
	    obj.sub_state = geo.sub_state
	end
	end
	after_validation :reverse_geocode 
	validates :sodt,   :presence => {:message => 'SĐT không được trống'},
		             numericality:{message: "Chỉ chứa kí tự số từ 0 đến 9"},
		            length: { in: 10..11 }
end
