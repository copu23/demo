class CuoccpnsController < ApplicationController
layout "admin"
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

def getcuocphi
	nackl = params[:nackhoiluong_id]
	dv = params[:dichvu_id] 
	vandonid = params[:vandon_id]
	
	tinh = Nguoinhan.select("tinh_id").where("nguoinhans.vandon_id = ? ",vandonid)
	vung = Tinh.select("vung_id").where("tinhs.id = ? ",tinh)

	


	muccuoc = Cuoccpn.select("muccuoc").where("cuoccpns.dichvu_id = ? 
				AND cuoccpns.nackhoiluong_id = ?
	 			AND cuoccpns.vung_id = ? ", dv, nackl, vung)
			
	render json:muccuoc

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
