class CreateVungs < ActiveRecord::Migration[5.0]
  def change
    create_table :vungs do |t|
      t.string :tenvung

      t.timestamps
    end
  end
end
