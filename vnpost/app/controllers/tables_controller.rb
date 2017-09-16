class TablesController < ApplicationController
	 before_action :set_table, only: [:show, :edit, :update, :destroy]

		def new
		@table= Table.new
	end

	def create
		@table = Table.new(table_params)
		if @table.save
		flash[:notice] = "Vận đơn tạo thành công."
		redirect_to @table
		else
			flash.now[:alert] = "Vận đơn tạo không thành công."
			render "new"
		end
	end

	def destroy
		@table = Table.find(params[:id])
		@table.destroy
		flash[:notice] = "Xóa vận đơn thành công"
		redirect_to tables_path
	end
	
	def index
		@tables = policy_scope(Table)
	end

	

	def show
	
	end

	def edit
		authorize @table, :update?
	end

	def update
		authorize @table, :update?
		@table = table.find(params[:id])
		if @table.update(table_params)
		flash[:notice] = "table has been updated."
		redirect_to @table
		else
			flash.now[:alert] = "table has not been updated."
			render "edit"
		end
	end

	

	private
		def table_params
			params.require(:table).permit(:name, :mota)
		end

		def set_table
			@table = Table.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The table you were looking for could not be found."
			redirect_to tables_path
		end

end
