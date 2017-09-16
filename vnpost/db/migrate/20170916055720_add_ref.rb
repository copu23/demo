class AddRef < ActiveRecord::Migration[5.0]
  def change
  	 remove_reference :hanghoas, :comment, foreign_key: true
  	 add_reference :comments, :hanghoa, foreign_key: true
  end
end
