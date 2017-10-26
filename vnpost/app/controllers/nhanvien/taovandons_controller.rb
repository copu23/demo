class Nhanvien::TaovandonsController < Nhanvien::ApplicationController
	before_action :set_taovandon, only: [:show, :edit, :update, :destroy]

	def create
		@taovandon = Taovandon.new(taovandon_params)
		if @taovandon.save
		flash[:notice] = "Tạo thành công."
		redirect_to @taovandon
		else
		flash.now[:alert] = "Tạo không thành công."
		render "new"
		end
	end 
	def  index
		@taovandons = Taovandon.all.order("trangthai DESC")
	end

	def new
		@taovandon = Taovandon.new
		
	end

	def show
		
	end

	def edit
		@taovandon = Taovandon.find(params[:id])
			
	end

	

	def update
		if @taovandon.update(taovandon_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to nhanvien_taovandon_path
		else
		flash.now[:alert] = "Cập nhật không thành công."
		render "edit"
		end

	end

	def destroy
		@taovandon.destroy
		flash[:notice] = "Xóa thành công."
		redirect_to nhanvien_taovandons_path
	end

private

	def set_taovandon
		@taovandon = Taovandon.find(params[:id])
	end

	
	

	def taovandon_params
	params.require(:taovandon).permit(:hotenkh, :diachi, :sdt, :khoiluong, :dichvu,:trangthai, :noinhan)
	end
end
