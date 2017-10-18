class SearchController < ApplicationController
	def search
		 @hanghoas = Vandon.joins(:hanghoas).timkiem(params[:searchs])
		# @hanghoas = Hanghoa.joins(:vandons).timkiem(params[:searchs])
	end
end
