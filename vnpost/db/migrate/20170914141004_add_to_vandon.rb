class AddToVandon < ActiveRecord::Migration[5.0]
  def change
  	 add_reference :nguoinhans, :vandon, foreign_key: true
  end
end
