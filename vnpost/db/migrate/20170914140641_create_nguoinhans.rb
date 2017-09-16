class CreateNguoinhans < ActiveRecord::Migration[5.0]
  def change
    create_table :nguoinhans do |t|
      t.string :hotennn
      t.string :sodtnn
      t.string :address
      t.string :city
      t.string :province
      t.string :sub_state
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
