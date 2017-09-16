class Role < ApplicationRecord
  belongs_to :user
  belongs_to :table

  def self.available_roles
	%w(manager editor viewer)
end
end
