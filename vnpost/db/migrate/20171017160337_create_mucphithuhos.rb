class CreateMucphithuhos < ActiveRecord::Migration[5.0]
  def change
    create_table :mucphithuhos do |t|
      t.string :tenmp
      t.integer :gtbd
      t.integer :gtkt
      t.integer :mucphi

      t.timestamps
    end
  end
end
