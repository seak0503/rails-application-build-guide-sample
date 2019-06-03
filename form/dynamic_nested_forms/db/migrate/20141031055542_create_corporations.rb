class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.comment '法人'
      t.string :name, null: false, comment: '名称'
      t.string :name_kana, null: false, comment: '名称カナ'

      t.timestamps null: false
    end
  end
end
