class Admin::StatesController < Admin::ApplicationController
	 before_action :set_state, only: [:show, :edit, :update, :destroy]
	 def  index
 	 	@states = State.all 
 	 	
 	 end

	def new
	@state = State.new
	end


	def create
	@state = State.new(state_params)
		if @state.save
		flash[:notice] = "Trạng thái tạo thành công"
		redirect_to states_path
		else
		flash.now[:alert] = "Trạng thái không tạo thành công"
		render "new"
		end
	end

	def destroy
		@state = State.find(params[:id])
		@state.destroy
		flash[:notice] = "Trạng thái đã được xóa."
		redirect_to states_path
	end
	def edit

			@state = State.find(params[:id])
 	 end

 	

	def update
		if @state.update(state_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to  admin_states_path
		else
		flash.now[:alert] = "Cập nhật không thành công."
		render "edit"
		end

	end


	private
	def set_state
	@state = State.find(params[:id])
	end
	def state_params
	params.require(:state).permit(:name, :color)
	end
end