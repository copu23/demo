class CreateTaovandons < ActiveRecord::Migration[5.0]
  def change
    create_table :taovandons do |t|
      t.string :hotenkh
      t.string :diachi
      t.string :sdt
      t.float :khoiluong
      t.string :dichvu
      t.string :trangthai , :default =>"Chờ duyệt"
      t.string :noinhan

      t.timestamps
    end
  end
end
