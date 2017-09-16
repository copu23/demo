class Admin::DichvucongthemsController < Admin::ApplicationController
	 before_action :set_dichvucongthem, only: [:show, :edit, :update, :destroy]
	 
	def new
		@dichvucongthem = Dichvucongthem.new
		
	end

	def create
		@dichvucongthem = Dichvucongthem.new(dichvucongthem_params)
		if @dichvucongthem.save
		flash[:notice] = "Dịch vụ tạo thành công."
		redirect_to @dichvucongthem
		else
		flash.now[:alert] = "Dịch vụ tạo không thành công."
		render "new"
		end
	end

	def destroy
		@dichvucongthem = Dichvucongthem.find(params[:id])
		@dichvucongthem.destroy
		flash[:notice] = "Dịch vụ đã được xóa."
		redirect_to dichvucongthems_path
	end

private
		def dichvucongthem_params
			params.require(:dichvucongthem).permit(:tendvct,:mota, :mcdvct)
		end
		
		def set_dichvucongthem
			@dichvucongthem = dichvucongthem.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ mà bạn can tìm."
			redirect_to dichvucongthems_path
		end
end
