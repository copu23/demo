class Comment < ApplicationRecord
   belongs_to :hanghoa
  belongs_to :nguoilap, class_name: "User"
  belongs_to :previous_state, class_name: "State"
   belongs_to :state
   delegate :vandon, to: :hanghoa
  scope :persisted, lambda { where.not(id: nil) }
  before_create :set_previous_state
  after_create :set_hanghoa_state

  private
	def set_hanghoa_state
  	hanghoa.state = state
  	hanghoa.save!
	end

  def set_previous_state
  self.previous_state = hanghoa.state
  end
end
