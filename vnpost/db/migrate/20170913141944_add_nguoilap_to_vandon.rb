class AddNguoilapToVandon < ActiveRecord::Migration[5.0]
  def change
     add_reference :vandons, :nguoilap, index: true
    add_foreign_key :vandons, :users, column: :nguoilap_id
  end
end
