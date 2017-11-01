class Admin::MucphithuhosController < Admin::ApplicationController
	before_action :set_mucphithuho, only: [:show, :edit, :update, :destroy]
	
	def new
		@mucphithuho = Mucphithuho.new
		
	end

	def create
		@mucphithuho = Mucphithuho.new(mucphithuho_params)
		if @mucphithuho.save
		flash[:notice] = "Tạo thành công."
		redirect_to action: "index"
		else
		flash.now[:alert] = "Tạo không thành công."
		render "new"
		end
	end

	def destroy
		@mucphithuho = Mucphithuho.find(params[:id])
		@mucphithuho.destroy
		flash[:notice] = "Đã được xóa."
		redirect_to mucphithuhos_path
	end
	def index
		@mucphithuhos = Mucphithuho.all
	end

	def show
		
		end

	def edit
		@mucphithuho = Mucphithuho.find(params[:id])
			
	end



	def update
		if @mucphithuho.update(mucphithuho_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to action: "index"
		else
		flash.now[:alert] = "Cập nhật không thành công."
		render "edit"
		end

	end
		def get_mucphi
			sotienthu = params[:tienthuho]

			mucphithuho = Mucphithuho.where("mucphithuhos.gtbd < ? AND mucphithuhos.gtkt >= ?", sotienthu, sotienthu).take
				render json:{id: mucphithuho ? mucphithuho.mucphi : nil}	

		end



private

def set_mucphithuho
			@mucphithuho = Mucphithuho.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Không tìm thấy khoi luong bạn cần tìm."
			
		end

def mucphithuho_params
params.require(:mucphithuho).permit(:tenmp, :mucphi, :gtbd, :gtkt)
end

end
