class Admin::DichvusController < Admin::ApplicationController
	 before_action :set_dichvu, only: [:show, :edit, :update, :destroy]
	 layout 'admin'
	def new
		@dichvu = Dichvu.new
		
	end

	def create
		@dichvu = Dichvu.new(dichvu_params)
		if @dichvu.save
		flash[:notice] = "Dịch vụ tạo thành công."
		redirect_to @dichvu
		else
		flash.now[:alert] = "Dịch vụ tạo không thành công."
		render "new"
		end
	end

	def destroy
		@dichvu = Dichvu.find(params[:id])
		@dichvu.destroy
		flash[:notice] = "Dịch vụ đã được xóa."
		redirect_to dichvus_path
	end

private
		def dichvu_params
			params.require(:dichvu).permit(:tendv,:mota, :tylegiatri)
		end
		
		def set_dichvu
			@dichvu = Dichvu.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ mà bạn can tìm."
			redirect_to dichvus_path
		end
end
