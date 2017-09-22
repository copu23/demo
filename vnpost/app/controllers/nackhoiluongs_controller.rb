class NackhoiluongsController < ApplicationController
	layout "admin"
	before_action :set_nackhoiluong, only: [:show, :edit, :update, :destroy]

def index
	@nackhoiluongs = Nackhoiluong.all
end

def show
	
	end

def edit
	@nackhoiluong = Nackhoiluong.find(params[:id])
		
end



def update
	if @nackhoiluong.update(nackhoiluong_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @nackhoiluong
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end
	def get_id
		khoiluong = params[:trongluongtinh]

		nackhoiluong = Nackhoiluong.where("nackhoiluongs.khoiluongbd < ? AND nackhoiluongs.khoiluongkt >= ?", khoiluong, khoiluong).take
			render json:{id: nackhoiluong ? nackhoiluong.id : nil}	

	end



private

def set_nackhoiluong
			@nackhoiluong = Nackhoiluong.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy khoi luong bạn cần tìm."
			redirect_to nackhoiluongs_path
		end

def nackhoiluong_params
params.require(:nackhoiluong).permit(:tennkl, :mota, :khoiluongbd, :khoiluongkt)
end


end
