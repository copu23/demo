class CuoccpnsController < ApplicationController

before_action :set_cuoccpn, only: [:show, :edit, :update, :destroy]

def index
	@cuoccpns = Cuoccpn.all
end

def show
	
	end

def edit
	@cuoccpn = Cuoccpn.find(params[:id])
		
end



def update
	if @cuoccpn.update(cuoccpn_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @cuoccpn
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end


private

def set_cuoccpn
			@cuoccpn = Cuoccpn.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ bạn cần tìm."
			redirect_to cuoccpns_path
		end

def cuoccpn_params
params.require(:cuoccpn).permit(:muccuoc, :vung_id, :nackhoiluong_id, :dichvu_id)
end


end
