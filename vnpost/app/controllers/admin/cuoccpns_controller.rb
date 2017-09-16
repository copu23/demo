class Admin::CuoccpnsController < ApplicationController
	 before_action :set_cuoccpn, only: [:show, :edit, :update, :destroy]
	def new
		@cuoccpn = Cuoccpn.new
		
	end

	def create
		@cuoccpn = Cuoccpn.new(cuoccpn_params)
		if @cuoccpn.save
		flash[:notice] = "Dịch vụ tạo thành công."
		redirect_to @cuoccpn
		else
		flash.now[:alert] = "Dịch vụ tạo không thành công."
		render "new"
		end
	end

	def destroy
		@cuoccpn = Cuoccpn.find(params[:id])
		@cuoccpn.destroy
		flash[:notice] = "Dịch vụ đã được xóa."
		redirect_to cuoccpns_path
	end

private
		def cuoccpn_params
			params.require(:cuoccpn).permit(:muccuoc, :vung_id, :nackhoiluong_id, :dichvu_id)
		end
		
		def set_cuoccpn
			@cuoccpn = cuoccpn.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ mà bạn can tìm."
			redirect_to cuoccpns_path
		end
end
