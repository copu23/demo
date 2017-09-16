class AddHanghoaToVandon < ActiveRecord::Migration[5.0]
  def change
    add_reference :vandons, :hanghoa, foreign_key: true
  end
end
