class AddNhanvienToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nhanvien, :boolean, default: false
  end
end
