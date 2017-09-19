class Xoa < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :hanghoas, :comment
  end
end
