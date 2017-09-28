class Admin::VandonsController < Admin::ApplicationController
	 before_action :set_vandon, only: [:show, :edit, :update, :destroy]
 
	def index
		@vandons = policy_scope(Vandon)
	end

	

	def show
	
	end

	def edit
		# authorize @vandon, :update?
	end

	def update
		authorize @vandon, :update?
		@vandon = vandon.find(params[:id])
		if @vandon.update(vandon_params)
		flash[:notice] = "vandon has been updated."
		redirect_to @vandon
		else
			flash.now[:alert] = "vandon has not been updated."
			render "edit"
		end
	end

	

	private
		def vandon_params
			params.require(:vandon).permit(:name, :mota, :term)
		end

		def set_vandon
			@vandon = Vandon.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The vandon you were looking for could not be found."
			redirect_to vandons_path
		end
end
