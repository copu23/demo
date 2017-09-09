class Role < ApplicationRecord
  belongs_to :user
  belongs_to :loaihang

  def self.available_roles
	%w(manager editor viewer)
end
end
