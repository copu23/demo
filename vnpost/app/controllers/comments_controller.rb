class CommentsController < ApplicationController
	before_action :set_hanghoa

def create
	@comment = @hanghoa.comments.build(comment_params)
	@comment.nguoilap = current_user
	authorize @comment, :create?
		if @comment.save
			flash[:notice] = " Tạo ghi chú thành công"
			if @comment.state_id == 3
				hanghoa_id = params[:hanghoa_id]
				vandonid = Hanghoa.where("hanghoas.id = ?", hanghoa_id).take
					
				sdt = Nguoinhan.where("nguoinhans.vandon_id = ? ",vandonid.id).take
				 phone = sdt.sodtnn

				require 'net/http'

				url = URI.parse('http://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_get?Phone='.phone.'&Conte
				nt=Da_phat_thanh_cong&ApiKey=402755FF8131A3AD920DC2CD9B83C4&SecretKey=C7A2E96BC4C3486F6F423CF831F42D&SmsType=4')
				# url = URI.parse('https://account.esms.vn/SMS/SMSManager')
				req = Net::HTTP::Get.new(url.to_s)
				res = Net::HTTP.start(url.host, url.port) {|http|
				  http.request(req)
				}
				 res.body
			end
	redirect_to [@hanghoa.vandon, @hanghoa]
		else
	flash.now[:alert] = "Tạo ghi chú không thành công."
	@vandon = @hanghoa.vandon
	render "hanghoas/show"
	end
end

private

	def set_hanghoa
		@hanghoa = Hanghoa.find(params[:hanghoa_id])
	end

	def comment_params
		params.require(:comment).permit(:text, :state_id)
	end
end