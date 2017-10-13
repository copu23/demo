class Addcolumntouser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :hoten, :string
  	add_column :users, :diachi, :string
  	add_column :users, :sdt, :string
  end
end
