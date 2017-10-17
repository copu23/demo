class AddColumnToHanghoa3 < ActiveRecord::Migration[5.0]
  def change
    add_column :hanghoas, :thuho, :integer
  
  end
end
