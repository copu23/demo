class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

	has_many :roles
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	scope :excluding_archived, lambda { where(archived_at: nil) }
  	 def to_s
	"#{email} (#{admin? ? "Admin" : "Người dùng"})"
	end

	def archive
		self.update(archived_at: Time.now)
	end

	def active_for_authentication?
		super && archived_at.nil?
	end


	def inactive_message
		archived_at.nil? ? super : :archived
	end

	def role_on(table)
		roles.find_by(table_id: table).try(:name)
	end



end
