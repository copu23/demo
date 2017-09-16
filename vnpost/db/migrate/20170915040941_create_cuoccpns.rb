class CreateCuoccpns < ActiveRecord::Migration[5.0]
  def change
    create_table :cuoccpns do |t|
      t.integer :muccuoc
      t.references :vung, foreign_key: true
      t.references :dichvu, foreign_key: true
      t.references :nackhoiluong, foreign_key: true

      t.timestamps
    end
  end
end
