class HomeController < ApplicationController
	layout "admin"
  def guiSMS
  	state_id= params[:state_id]
	hanghoa_id = params[:hanghoa_id]
	vandonid = Hanghoa.where("hanghoas.id = ?", hanghoa_id).take
	
	sdt = Nguoinhan.where("nguoinhans.vandon_id = ? ",vandonid.vandon_id).take
 	# render json: sdt.sodtnn
 	phone = sdt.sodtnn
  	 	if state_id == "7"
			 render json:phone
		# require 'net/http'

		# url = URI.parse('http://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_get?Phone='+phone+'&Conte
		# nt=Da+phat+thanh+cong&ApiKey=402755FF8131A3AD920DC2CD9B83C4&SecretKey=C7A2E96BC4C3486F6F423CF831F42D&SmsType=4')
		# # url = URI.parse('https://account.esms.vn/SMS/SMSManager')
		# req = Net::HTTP::Get.new(url.to_s)
		# res = Net::HTTP.start(url.host, url.port) {|http|
		#   http.request(req)
		# }
		#  res.body
	else render json: "that bai"
			
 	 	end
  end
end
