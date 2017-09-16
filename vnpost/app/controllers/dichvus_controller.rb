class DichvusController < ApplicationController

before_action :set_dichvu, only: [:show, :edit, :update, :destroy]

def index
	@dichvus = Dichvu.all
end

def show
	
	end

def edit
	@dichvu = Dichvu.find(params[:id])
		
end



def update
	if @dichvu.update(dichvu_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @dichvu
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end


private

def set_dichvu
			@dichvu = Dichvu.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ bạn cần tìm."
			redirect_to dichvus_path
		end

def dichvu_params
params.require(:dichvu).permit(:tendv, :mota, :tylegiatri)
end



end
