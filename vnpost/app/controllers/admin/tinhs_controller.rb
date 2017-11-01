class Admin::TinhsController < Admin::ApplicationController
	before_action :set_tinh, only: [:show, :edit, :update, :destroy]
	def new
		@tinh = Tinh.new
		
	end

	def create
		@tinh = Tinh.new(tinh_params)
		if @tinh.save
		flash[:notice] = "Tỉnh tạo thành công."
		redirect_to admin_tinhs_path
		else
		flash.now[:alert] = "Tỉnh tạo không thành công."
		render "new"
		end
	end
	def index
		@tinhs = Tinh.all

	end
	def show
		
	end

	def destroy
		@tinh = Tinh.find(params[:id])
		@tinh.destroy
		flash[:notice] = "Dịch vụ đã được xóa."
		redirect_to tinhs_path
	end

private
		def tinh_params
			params.require(:tinh).permit(:tentinh, :vung_id)
		end
		
		def set_tinh
			@tinh = Tinh.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ mà bạn can tìm."
			redirect_to tinhs_path
		end
end
