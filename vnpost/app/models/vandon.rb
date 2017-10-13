class Vandon < ApplicationRecord
	
	has_many :hanghoas, dependent: :delete_all
	belongs_to :nguoilap, class_name: "User"
	has_many :khachhangs, dependent: :delete_all
	has_many :nguoinhans, dependent: :delete_all
	 # belongs_to :state
	# belongs_to :nguoinhan
	# has_many :comments, dependent: :destroy

	def self.timkiem(searchs)
		conditions ="vandon_id LIKE ?","%#{searchs}%"
	   @results = Hanghoa.where(conditions)
	    # where("vandon_id LIKE ?", "%#{search}%")
	end
	

	def self.search(search, page)
		conditions ="hotennn LIKE ? OR sodtnn LIKE ? OR vandon_id LIKE ?","%#{search}%", "%#{search}%","%#{search}%"
	  # paginate :per_page => 5, :page => page,
	  #          :conditions
	  #          :order => 'created_at DESC'

	  @results = Vandon.where(conditions).paginate(:page => page, :per_page => 2)
	end




end