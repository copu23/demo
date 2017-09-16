class RenameKhachhang < ActiveRecord::Migration[5.0]
  def change
  	rename_column :khachhangs, :diachi, :address
  	rename_column :khachhangs, :quanhuyen, :sub_state
  	rename_column :khachhangs, :tinh, :province
  	rename_column :khachhangs, :thanhpho, :city
  	rename_column :khachhangs, :vido, :latitude
  	rename_column :khachhangs, :kinhdo, :longitude
  end
end
