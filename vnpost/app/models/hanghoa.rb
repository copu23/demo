class Hanghoa < ApplicationRecord
	  # belongs_to :state
	belongs_to :vandon
	belongs_to :dichvu
	belongs_to :dichvucongthem
	has_many :comments, dependent: :destroy
	
	 belongs_to :state
	     
 	validates_numericality_of :trongluongtinh, :greater_than=> 0 , message: "khối lượng phải lớn hơn 0"
	




	
end
