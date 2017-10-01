class VandonsController < ApplicationController
   before_action :set_vandon, only: [:show, :edit, :update, :destroy]
    layout 'admin'
	# before_action :set_hanghoa, only: [:show, :edit, :update, :destroy]
		def new
		@vandon= Vandon.new
	end

	def create
		@vandon = Vandon.new(vandon_params)
		@vandon.nguoilap = current_user

		if @vandon.save

		flash[:notice] = "Vận đơn tạo thành công."
		redirect_to @vandon
		else
			flash.now[:alert] = "Vận đơn tạo không thành công."
			render "new"
		end
	end
	def index
		@vandons = policy_scope(Vandon)
		#  @vandons = Vandon.search(params[:term])
		# @vandons = if params[:term]
  #   Vandon.where('id LIKE ?', "%#{params[:term]}%")
  # else
  #   Vandon.all
  # end

  if params[:search]
    @vandons = Vandon.search(params[:search]).order("created_at DESC")
  else
    @vandons = Vandon.all.order('created_at DESC')
  end
	end

	

	def show
		
	end

	def edit
		authorize @vandon, :update?
	end

	def update
		authorize @vandon, :update?
		@vandon = Vandon.find(params[:id])
		if @vandon.update(vandon_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to @vandon
		else
			flash.now[:alert] = "Cập nhật không thành công."
			render "edit"
		end
	end

	def destroy
		@vandon = Vandon.find(params[:id])
		@vandon.destroy
		flash[:notice] = "Xóa vận đơn thành công"
		redirect_to vandons_path
	end
	

	

	private
		def vandon_params
			params.require(:vandon).permit(:mota, :hanghoa_id, :term)
		end

		def set_vandon
			@vandon = Vandon.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The vandon you were looking for could not be found."
			redirect_to vandons_path
		end
end
