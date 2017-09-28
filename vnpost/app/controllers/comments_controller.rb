class CommentsController < ApplicationController
	before_action :set_hanghoa

def create
	@comment = @hanghoa.comments.build(comment_params)
	@comment.nguoilap = current_user
	authorize @comment, :create?
		if @comment.save
	flash[:notice] = " Tạo ghi chú thành công"
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