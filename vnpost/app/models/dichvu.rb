class Dichvu < ApplicationRecord
	has_many :hanghoas

	validates :tendv, presence: true, uniqueness: {message: "Dich vu da ton tai"}
end
