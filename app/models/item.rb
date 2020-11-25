class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validataes :name
    validataes :detail
    validataes :category_id
    validataes :condition_id
    validataes :delivery_fee_id
    validataes :prefecture_id
    validataes :shipping_date_id
    validataes :price
  end
end
