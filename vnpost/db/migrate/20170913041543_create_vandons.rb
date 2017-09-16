class CreateVandons < ActiveRecord::Migration[5.0]
  def change
    create_table :vandons do |t|

      t.timestamps
    end
  end
end
