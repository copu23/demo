class Admin::VungsController < ApplicationController
		before_action :set_vung, only: [:show, :edit, :update, :destroy]
	def new
		@vung = Vung.new
		
	end

	def create
		@vung = Vung.new(vung_params)
		if @vung.save
		flash[:notice] = "Dịch vụ tạo thành công."
		redirect_to @vung
		else
		flash.now[:alert] = "Dịch vụ tạo không thành công."
		render "new"
		end
	end

	def destroy
		@vung = Vung.find(params[:id])
		@vung.destroy
		flash[:notice] = "Dịch vụ đã được xóa."
		redirect_to vungs_path
	end

private
		def vung_params
			params.require(:vung).permit(:tenvung, :vung_id)
		end
		
		def set_vung
			@vung = Vung.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ mà bạn can tìm."
			redirect_to vungs_path
		end
end
