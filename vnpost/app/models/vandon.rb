class Vandon < ApplicationRecord
	has_many :hanghoas, dependent: :delete_all
	belongs_to :nguoilap, class_name: "User"
	has_many :khachhangs, dependent: :delete_all
	has_many :nguoinhans, dependent: :delete_all
	# belongs_to :nguoinhan
	# has_many :comments, dependent: :destroy

def self.search(term)
  if term
    where('id LIKE ?', "%#{term}%").order('id DESC')
  else
    order('id DESC') 
  end
end
end