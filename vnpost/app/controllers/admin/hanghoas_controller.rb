class Admin::HanghoasController < Admin::ApplicationController
	before_action :set_vandon	

	before_action :set_hanghoa, only: [:show, :edit, :update, :destroy]
	# before_action :set_nackhoiluong
	def create
		@hanghoa = @vandon.hanghoas.build(hanghoa_params)

	
		if @hanghoa.save
		flash[:notice] = "Tạo thành công."
		redirect_to [:admin,@vandon]
		else
		flash.now[:alert] = "Tạo không thành công."
		render "new"
		end
	end 

	def new
		@hanghoa = @vandon.hanghoas.build
	end

	def show
	# authorize @hanghoa, :show?
	@comment = @hanghoa.comments.build(state_id: @hanghoa.state_id)
	
	end

	def edit
		@hanghoa = Hanghoa.find(params[:id])
			
	end

	def update
		if @hanghoa.update(hanghoa_params)
		flash[:notice] = "Cập nhật thành công."
		redirect_to [:admin,@vandon]
		else
		flash.now[:alert] = "Cập nhật không thành công."
		render "edit"
		end

	end



	def destroy
		@hanghoa.destroy
		flash[:notice] = "Xóa thành công."
		redirect_to [:admin,@vandon]
	end


private

	def set_hanghoa
		@hanghoa = @vandon.hanghoas.find(params[:id])
	end

	def set_vandon
		@vandon = Vandon.find(params[:vandon_id])
	end

	def hanghoa_params
		params.require(:hanghoa).permit(:tienthuho,:cuocthuho,:thuho,:trongluongtinh, :trongluongquydoi, :chieudai, :chieucao, :chieurong, :cuocchinh, :cuocphu, :tongcuoc, :motachitiet, :dichvu_id, :dichvucongthem_id, :state_id)
	end

end
