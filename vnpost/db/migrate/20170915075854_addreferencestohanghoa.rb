class Addreferencestohanghoa < ActiveRecord::Migration[5.0]
  def change
  	add_reference :hanghoas, :dichvu, foreign_key: true
  	add_reference :hanghoas, :dichvucongthem, foreign_key: true
  end
end
