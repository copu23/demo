class Table < ApplicationRecord
	has_many :dichvus
	has_many :roles, dependent: :delete_all
	validates :name, presence: true, uniqueness: {message: "Bang da ton tai"}
end
