class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null:false
      t.text :detail, null:false
      t.integer :category_id, null:false
      t.integer :condition_id, null:false
      t.integer :delivery_fee_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :shipping_date_id, null:false
      t.timestamps
    end
  end
end
