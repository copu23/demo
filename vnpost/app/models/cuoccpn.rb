class Cuoccpn < ApplicationRecord
  belongs_to :vung
  belongs_to :dichvu
  belongs_to :nackhoiluong
   validates_uniqueness_of :nackhoiluong_id ,:scope =>[:dichvu_id,:vung_id], message:"Bảng cước đã tồn tại"
end
