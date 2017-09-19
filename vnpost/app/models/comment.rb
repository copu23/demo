class Comment < ApplicationRecord
   belongs_to :hanghoa
  belongs_to :nguoilap, class_name: "User"
   belongs_to :state
   delegate :vandon, to: :hanghoa
  scope :persisted, lambda { where.not(id: nil) }
  after_create :set_hanghoa_state
  private
	def set_hanghoa_state
	hanghoa.state = state
	hanghoa.save!
	end
end
