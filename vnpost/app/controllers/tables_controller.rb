class TablesController < ApplicationController
	 before_action :set_table, only: [:show, :edit, :update, :destroy]
	def index
		@tables= Table.all
	end

	

	def show
	
	end

	def edit
		@table = Table.find(params[:id])
		
	end

	def update
		@table = Table.find(params[:id])
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
