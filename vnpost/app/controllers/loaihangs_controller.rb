class LoaihangsController < ApplicationController

	 before_action :set_loaihang, only: [:show, :edit, :update, :destroy]
	def index
		@loaihangs= Loaihang.all
	end

	

	def show
	
	end

	

	def edit
		@loaihang = Loaihang.find(params[:id])
		
	end

	def update
		@loaihang = Loaihang.find(params[:id])
		if @loaihang.update(loaihang_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to @loaihang
		else
			flash.now[:alert] = "Cập nhật không thành công."
			render "edit"
		end
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
