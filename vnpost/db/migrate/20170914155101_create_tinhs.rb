class CreateTinhs < ActiveRecord::Migration[5.0]
  def change
    create_table :tinhs do |t|
      t.string :tentinh

      t.timestamps
    end
  end
end
