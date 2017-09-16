class CreateNackhoiluongs < ActiveRecord::Migration[5.0]
  def change
    create_table :nackhoiluongs do |t|
      t.string :tennkl
      t.string :mota

      t.timestamps
    end
  end
end
