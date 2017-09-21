class TinhcuocsController < ApplicationController
	before_action :set_nackhoiluong
	def tinhcuoc
		khoiluong = params[:trongluongtinh] 
	
	@nackhoiluongs.each do |nackhoiluong|
 		 if khoiluong >= nackhoiluong.khoiluongbd && khoiluong <= mackhoiluong.khoiluongkt 
				return nackhoiluong.id
				
		 end 
	
	render json:nackhoiluong.id
	end
	end
end
