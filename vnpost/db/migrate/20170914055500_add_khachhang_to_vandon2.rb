class AddKhachhangToVandon2 < ActiveRecord::Migration[5.0]
  def change
    add_reference :khachhangs, :vandon, foreign_key: true
  end
end
