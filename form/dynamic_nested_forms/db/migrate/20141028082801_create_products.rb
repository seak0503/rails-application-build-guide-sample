class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.comment '商品'
      t.string  :code, null: false,              comment: '商品コード'
      t.string  :name, null: false,              comment: '商品名'
      t.string  :name_kana, null: false, default: '', comment: '商品名カナ'
      t.integer :price,                    null: false,              comment: '商品価格'
      t.integer :purchase_cost,            null: false,              comment: '仕入原価'
      t.boolean :availability,             null: false,              comment: '販売可能フラグ'

      t.timestamps null: false
    end
  end
end
