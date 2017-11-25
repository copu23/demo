class Admin::NackhoiluongsController < Admin::ApplicationController
	before_action :set_nackhoiluong, only: [:show, :edit, :update, :destroy]
	def new
		@nackhoiluong = Nackhoiluong.new
		
	end
	def  index
		@nackhoiluongs =Nackhoiluong.all
		
	end
	def show
		
	end

	def create
		@nackhoiluong = Nackhoiluong.new(nackhoiluong_params)
		if @nackhoiluong.save
		flash[:notice] = "Dịch vụ tạo thành công."
		redirect_to @nackhoiluong
		else
		flash.now[:alert] = "Dịch vụ tạo không thành công."
		render "new"
		end
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
	def destroy
		@nackhoiluong = Nackhoiluong.find(params[:id])
		@nackhoiluong.destroy
		flash[:notice] = "Dịch vụ đã được xóa."
		redirect_to nackhoiluongs_path
	end

private
		def nackhoiluong_params
			params.require(:nackhoiluong).permit(:tennkl, :mota, :khoiluongbd, :khoiluongkt)
		end
		
		def set_nackhoiluong
			@nackhoiluong = Nackhoiluong.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy dịch vụ mà bạn can tìm."
			redirect_to nackhoiluongs_path
		end
end
