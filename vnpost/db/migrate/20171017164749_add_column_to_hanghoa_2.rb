class AddColumnToHanghoa2 < ActiveRecord::Migration[5.0]
  def change
    add_column :hanghoas, :cuocthuho, :integer
  end
end
