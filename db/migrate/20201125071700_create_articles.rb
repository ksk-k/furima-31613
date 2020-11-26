class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null:false
      t.text :detail, null:false
      t.integer :category_id, nill:false
      t.integer :condition_id, nill:false
      t.integer :delivery_fee_id, nill:false
      t.integer :prefecture_id, nill:false
      t.integer :shipping_date_id, nill:false
      t.timestamps
    end
  end
end
