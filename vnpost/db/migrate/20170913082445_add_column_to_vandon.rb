class AddColumnToVandon < ActiveRecord::Migration[5.0]
  def change
    add_column :vandons, :mota, :string
  end
end
