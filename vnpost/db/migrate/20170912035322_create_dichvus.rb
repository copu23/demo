class CreateDichvus < ActiveRecord::Migration[5.0]
  def change
    create_table :dichvus do |t|
      t.string :tendv
      t.text :mota
      t.float :tylegiatri, default: 1.0
      t.timestamps
    end
  end
end
