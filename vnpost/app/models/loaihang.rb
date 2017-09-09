class Loaihang < ApplicationRecord
	validates :tenlh, presence: true
	has_many :roles, dependent: :delete_all
end
