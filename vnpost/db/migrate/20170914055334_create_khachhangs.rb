class CreateKhachhangs < ActiveRecord::Migration[5.0]
  def change
    create_table :khachhangs do |t|
      t.string :hotenkh
      t.string :sodt
      t.string :diachi
      t.string :quanhuyen
      t.string :thanhpho
      t.string :tinh

      t.timestamps
    end
  end
end
