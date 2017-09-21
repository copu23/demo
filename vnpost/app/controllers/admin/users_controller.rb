class Admin::UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :archive]
before_action :set_tables, only: [:new, :create, :edit, :update]
layout 'admin'

 def index
		@users = User.excluding_archived.order(:email)
end


  def new
  	@user = User.new
  end

  def show

  end

  def edit

  end

  def create
		@user = User.new(user_params)
		build_roles_for(@user)
		if @user.save
		flash[:notice] = "Tạo người dùng thành công."
		redirect_to admin_users_path
		else
		flash.now[:alert] = "Tạo người dùng không thành công."
		render "new"
		end
	end
def update
	if params[:user][:password].blank?
	params[:user].delete(:password)
	end
	User.transaction do
	@user.roles.clear
	build_roles_for(@user)
	role_data = params.fetch(:roles, [])
	role_data.each do |table_id, role_name|
	if role_name.present?
	@user.roles.build(table_id: table_id, role: role_name)
	end
	end
	if @user.update(user_params)
	flash[:notice] = "Cập nhật thành công."
	redirect_to admin_users_path
	else
	flash.now[:alert] = "Cập nhật không thành công."
	render "edit"
	raise ActiveRecord::Rollback
	end
	end
end

def archive
if @user == current_user
flash[:alert] = "Không thể vô hiệu hóa chính bạn!"
else
@user.archive
flash[:notice] = "Tài khoản đã bị vô hiệu hóa"
end
redirect_to admin_users_path
end

private
	def build_roles_for(user)
		role_data = params.fetch(:roles, [])
		role_data.each do |table_id, role_name|
		if role_name.present?
		user.roles.build(table_id: table_id, role: role_name)
		end
		end
	end

	def user_params
		params.require(:user).permit(:email, :password, :admin)
	end
	def set_user
		@user = User.find(params[:id])
	end

	def set_tables
		@tables = Table.order(:name)
	end
end
