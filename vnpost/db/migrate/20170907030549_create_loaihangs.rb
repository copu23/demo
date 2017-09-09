class CreateLoaihangs < ActiveRecord::Migration[5.0]
  def change
    create_table :loaihangs do |t|
      t.string :tenlh
      t.text :mota

      t.timestamps
    end
  end
end
