class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string      :title,            null: false
      t.text        :explain,          null: false
      t.integer     :prefecture_id,    null: false
      t.text        :local,            null: false
      t.integer     :price,            null: false
      t.string      :building,         null: false
      t.string      :other
      t.references  :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
