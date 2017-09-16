class CreateHanghoas < ActiveRecord::Migration[5.0]
  def change
    create_table :hanghoas do |t|
      t.float :trongluongtinh
      t.float :trongluongquydoi
      t.float :chieudai
      t.float :chieucao
      t.float :chieurong
      t.text :motachitiet
      t.integer :cuocchinh
      t.integer :cuocphu
      t.integer :tongcuoc

      t.timestamps
    end
  end
end
