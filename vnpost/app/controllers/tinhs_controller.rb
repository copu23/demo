class TinhsController < ApplicationController
	before_action :set_tinh, only: [:show, :edit, :update, :destroy]

def index
	@tinhs = Tinh.all
end

def show
	
	end

def edit
	@tinh = Tinh.find(params[:id])
		
end

def getvung_id
		tinhtp = params[:tinh_id]

	

		tinh = Tinh.where("tinhs.id = ?", tinhtp).take
			render json:{id: tinh ? tinh.vung_id : nil}	

		
	end

def update
	if @tinh.update(tinh_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @tinh
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end


private

def set_tinh
			@tinh = Tinh.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ bạn cần tìm."
			redirect_to tinhs_path
		end

def tinh_params
params.require(:tinh).permit(:tentinh, :vung_id)
end

end
