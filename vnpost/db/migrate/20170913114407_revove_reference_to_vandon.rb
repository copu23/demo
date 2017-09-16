class RevoveReferenceToVandon < ActiveRecord::Migration[5.0]
  def change

  	remove_reference :vandons, :hanghoa, index: true, foreign_key: true
  	add_reference :hanghoas, :vandon, foreign_key: true
  end
end
