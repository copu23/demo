class Admin::statesController < Admin::ApplicationController
	 before_action :set_state, only: [:show, :edit, :update, :destroy]
 
	def index
		@states = policy_scope(state)
	end

	

	def show
	
	end

	def edit
		# authorize @state, :update?
	end

	def update
		authorize @state, :update?
		@state = State.find(params[:id])
		if @state.update(state_params)
		flash[:notice] = "state has been updated."
		redirect_to @state
		else
			flash.now[:alert] = "state has not been updated."
			render "edit"
		end
	end

	def update
		authorize @state, :update?
		@state = State.find(params[:id])
		if @state.update(state_params)
		flash[:notice] = "Cập nhật thành công"
		redirect_to @state
		else
			flash.now[:alert] = "Cập nhật không thành công."
			render "edit"
		end
	end

	def destroy
		@state = State.find(params[:id])
		@state.destroy
		flash[:notice] = "Trạng thái đã được xóa."
		redirect_to states_path
	end


	

	private
		def state_params
			params.require(:state).permit(:name, :mota, :term)
		end

		def set_state
			@state = state.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The state you were looking for could not be found."
			redirect_to states_path
		end
end
