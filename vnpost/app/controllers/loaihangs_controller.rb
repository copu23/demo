class LoaihangsController < ApplicationController

	 before_action :set_loaihang, only: [:show, :edit, :update, :destroy]
	def index
	@loaihangs = Loaihang.all
	end


		
	def show

	end

	

	def edit
		@table = Table.find(params[:id])
		
	end


	def update
		
		if @loaihang.update(loaihang_params)
		flash[:notice] = "loaihang has been updated."
		redirect_to @loaihang
		else
		flash.now[:alert] = "loaihang has not been updated."
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
