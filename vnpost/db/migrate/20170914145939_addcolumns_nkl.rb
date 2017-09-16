class AddcolumnsNkl < ActiveRecord::Migration[5.0]
  def change
  	add_column :nackhoiluongs, :khoiluongbd, :float
  	add_column :nackhoiluongs, :khoiluongkt, :float
  end
end
