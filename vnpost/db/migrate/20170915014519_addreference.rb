class Addreference < ActiveRecord::Migration[5.0]
  def change
  	 add_reference :tinhs, :vung, foreign_key: true
  	 add_reference :nguoinhans, :tinh, foreign_key: true
  end
end
