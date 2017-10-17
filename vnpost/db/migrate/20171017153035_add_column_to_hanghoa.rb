class AddColumnToHanghoa < ActiveRecord::Migration[5.0]
  def change
    add_column :hanghoas, :tienthuho, :integer
  end
end
