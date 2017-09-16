class Admin::TablesController < Admin::ApplicationController
	def new
		@table= Table.new
	end

	def create
		@table = Table.new(table_params)
		if @table.save
		flash[:notice] = "bang duoc tao thanh cong."
		redirect_to @table
		else
			flash.now[:alert] = "table has not been created."
			render "new"
		end
	end

	def destroy
		@table = Table.find(params[:id])
		@table.destroy
		flash[:notice] = "table has been deleted."
		redirect_to tables_path
	end
	

	private
		def table_params
		params.require(:table).permit(:name, :mota)
		end
	
end
