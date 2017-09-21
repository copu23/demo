class Admin::ApplicationController < ApplicationController
	 layout 'admin'
  before_action :authorize_admin!
  def index

  end
private
  def authorize_admin!
	authenticate_user!
	unless current_user.admin?
	redirect_to admin_application_index_path, alert: "You must be an admin to do that."
	end
end
end
