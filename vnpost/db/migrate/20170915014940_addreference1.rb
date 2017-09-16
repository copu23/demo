class Addreference1 < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :vungs, :tinh, index: true, foreign_key: true
  	remove_reference :tinhs, :nguoinhan, index: true, foreign_key: true
  	add_reference :tinhs, :vung, foreign_key: true
  	 add_reference :nguoinhans, :tinh, foreign_key: true
  end
end
