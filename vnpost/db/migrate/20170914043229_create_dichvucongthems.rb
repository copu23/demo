class CreateDichvucongthems < ActiveRecord::Migration[5.0]
  def change
    create_table :dichvucongthems do |t|
      t.string :tendvct
      t.text :mota
      t.integer :mcdvct

      t.timestamps
    end
  end
end
