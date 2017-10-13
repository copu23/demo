class KhachhangsController < ApplicationController
	layout "admin"
	before_action :set_vandon	

	before_action :set_khachhang, only: [:show, :edit, :update, :destroy]
	def index
		
	end
	
	def create
		@khachhang = @vandon.khachhangs.build(khachhang_params)
		if @khachhang.save
		flash[:notice] = "Tạo thành công."
		redirect_to @vandon
		else
		flash.now[:alert] = "Tạo không thành công."
		render "new"
		end
	end 

	def new
		@khachhang = @vandon.khachhangs.build
	end

	def show
		
	end

	def edit
		@khachhang = Khachhang.find(params[:id])
			
	end

	def update
		if @khachhang.update(khachhang_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to @vandon
		else
		flash.now[:alert] = "Cập nhật không thành công."
		render "edit"
		end

	end

	def destroy
		@khachhang.destroy
		flash[:notice] = "Xóa thành công."
		redirect_to @vandon
	end

private

	def set_khachhang
		@khachhang = @vandon.khachhangs.find(params[:id])
	end

	
	def set_vandon
	@vandon = Vandon.find(params[:vandon_id])
	end

	def khachhang_params
	params.require(:khachhang).permit(:hotenkh, :sodt, :address, :longitude, :latitude, :sub_state, :province,:city)
	end

end
