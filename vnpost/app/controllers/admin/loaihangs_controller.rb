class Admin::LoaihangsController < Admin::ApplicationController
 before_action :set_loaihang, only: [:show, :edit, :update, :destroy]
	def new
		@loaihang = Loaihang.new
		
	end

	def create
		@loaihang = Loaihang.new(loaihang_params)
		if @loaihang.save
		flash[:notice] = "Loại hàng tạo thành công."
		redirect_to @loaihang
		else
		flash.now[:alert] = "Loại hàng tạo không thành công."
		render "new"
		end
	end

	def destroy
		@loaihang = Loaihang.find(params[:id])
		@loaihang.destroy
		flash[:notice] = "Loại hàng đã được xóa."
		redirect_to loaihangs_path
	end

private
		def loaihang_params
			params.require(:loaihang).permit(:tenlh, :mota)
		end
		
		def set_loaihang
			@loaihang = Loaihang.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The loaihang you were looking for could not be found."
			redirect_to loaihangs_path
		end
end
