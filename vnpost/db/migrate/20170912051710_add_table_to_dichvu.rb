class AddTableToDichvu < ActiveRecord::Migration[5.0]
  def change
    add_reference :dichvus, :table, foreign_key: true
  end
end
