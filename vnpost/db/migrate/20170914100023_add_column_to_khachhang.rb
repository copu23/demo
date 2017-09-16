class AddColumnToKhachhang < ActiveRecord::Migration[5.0]
  def change
  	add_column :khachhangs, :kinhdo, :string
  	add_column :khachhangs, :vido, :string
  end
end
