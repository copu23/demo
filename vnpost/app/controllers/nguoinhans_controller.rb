class NguoinhansController < ApplicationController
		before_action :set_vandon	

	before_action :set_nguoinhan, only: [:show, :edit, :update, :destroy]

	def create
		@nguoinhan = @vandon.nguoinhans.build(nguoinhan_params)
		if @nguoinhan.save
		flash[:notice] = "Tạo thành công."
		redirect_to [@vandon, @nguoinhan]
		else
		flash.now[:alert] = "Tạo không thành công."
		render "new"
		end
	end 

	def new
		@nguoinhan = @vandon.nguoinhans.build
	end

	def show
		
	end

	def edit
		@nguoinhan = Nguoinhan.find(params[:id])
			
	end

	def update
		if @nguoinhan.update(nguoinhan_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to [@vandon, @nguoinhan]
		else
		flash.now[:alert] = "Cập nhật không thành công."
		render "edit"
		end

	end

	def destroy
		@nguoinhan.destroy
		flash[:notice] = "Xóa thành công."
		redirect_to @vandon
	end

private

	def set_nguoinhan
		@nguoinhan = @vandon.nguoinhans.find(params[:id])
	end

	
	def set_vandon
	@vandon = Vandon.find(params[:vandon_id])
	end

	def nguoinhan_params
	params.require(:nguoinhan).permit(:hotennn, :sodtnn, :address, :longitude, :latitude, :sub_state, :province,:city, :tinh_id)
	end
end
