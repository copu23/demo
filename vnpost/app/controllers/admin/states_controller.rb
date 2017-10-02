class Admin::StatesController < Admin::ApplicationController
	
	def new
	@state = State.new
	end

	def create
	@state = State.new(state_params)
		if @state.save
		flash[:notice] = "Trạng thái tạo thành công"
		redirect_to admin_states_path
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


	private
	def state_params
	params.require(:state).permit(:name, :color)
	end
end