class Table < ApplicationRecord
	validates :name, presence: true, uniqueness: {message: "Bang da ton tai"}
end
