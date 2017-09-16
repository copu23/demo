class DichvucongthemsController < ApplicationController
	before_action :set_dichvucongthem, only: [:show, :edit, :update, :destroy]

def index
	@dichvucongthems = Dichvucongthem.all
end

def show
	
	end

def edit
	@dichvucongthem = Dichvucongthem.find(params[:id])
		
end



def update
	if @dichvucongthem.update(dichvucongthem_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @dichvucongthem
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end


private

def set_dichvucongthem
			@dichvucongthem = Dichvucongthem.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ bạn cần tìm."
			redirect_to dichvucongthems_path
		end

def dichvucongthem_params
params.require(:dichvucongthem).permit(:tendvct, :mota, :mvdvct)
end
end
