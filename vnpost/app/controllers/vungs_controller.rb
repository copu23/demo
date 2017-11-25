class VungsController < ApplicationController
	before_action :set_vung, only: [:show, :edit, :update, :destroy]
	layout "admin"

def index
	@vungs = Vung.all
end

def show
	
	end

def edit
	@vung = Vung.find(params[:id])
		
end



def update
	if @vung.update(vung_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @vung
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end


private

def set_vung
			@vung = Vung.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ bạn cần tìm."
			redirect_to vungs_path
		end

def vung_params
params.require(:vung).permit(:tenvung)
end

end
