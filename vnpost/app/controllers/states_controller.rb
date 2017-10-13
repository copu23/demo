class StatesController < ApplicationController
	before_action :set_state, only: [:show, :edit, :update, :destroy]
	layout "admin"
	def index
	@states = State.all
	end
	

	
  def show

  end

  def edit

  end

def update
	if @state.update(state_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to  @state
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	end

end

	private
	def state_params
	params.require(:state).permit(:name, :color)
	end
end
