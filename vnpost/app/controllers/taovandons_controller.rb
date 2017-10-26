class TaovandonsController < ApplicationController

	 before_action :set_taovandon, only: [:show, :edit, :update, :destroy]
	def index
	@taovandons = Taovandon.all.order("trangthai DESC")
	end

	def new
		@taovandon= Taovandon.new
	end

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
		
	def show

	end

	

	def edit
		@taovandon = Taovandon.find(params[:id])
		
	end


	def update
		
	
	if @taovandon.update(taovandon_params)
		flash[:notice] = ""
		redirect_to @taovandon
		else
		flash.now[:alert] = "taovandon has not been updated."
		render "edit"
		end
	end

		
	

	private
		def taovandon_params
			params.require(:taovandon).permit(:hotenkh, :diachi, :sdt, :khoiluong, :dichvu,:trangthai, :noinhan)
		end

		def set_taovandon
			@taovandon = Taovandon.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The taovandon you were looking for could not be found."
			redirect_to taovandons_path
		end
	
end
