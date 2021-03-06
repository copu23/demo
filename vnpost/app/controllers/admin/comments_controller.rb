class Admin::CommentsController < Admin::ApplicationController
	before_action :set_hanghoa
	# layout "admin"

	def create

		@comment = @hanghoa.comments.build(comment_params)
		@comment.nguoilap = current_user
		authorize @comment, :create?
			if @comment.save
				flash[:notice] = "Thay đổi trạng thái thành công."
				
		redirect_to [:admin,@hanghoa.vandon, @hanghoa]
			else
		flash.now[:alert] = "Thay đổi trạng thái không thành công."
		@vandon = @hanghoa.vandon
		 render "hanghoas/show"
		end
	end

# def getid
# 				hanghoa_id = params[:hanghoa_id]
# 				vandonid = Hanghoa.where("hanghoas.id = ?", hanghoa_id).take
				
# 				sdt = Nguoinhan.where("nguoinhans.vandon_id = ? ",vandonid.id).take
# 				render json:{id: sdt ? sdt.sodtnn : nil}

# end

private

	def set_hanghoa
		@hanghoa = Hanghoa.find(params[:hanghoa_id])
	end

	def comment_params
		params.require(:comment).permit(:text, :state_id)
	end
end
