class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :hanghoa, foreign_key: true
      t.references :nguoilap, index: true

      t.timestamps

    end

   end

  add_foreign_key :comments, :users, column: :nguoilap_id
end
