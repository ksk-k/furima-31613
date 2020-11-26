class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    VALID_PRICEL_HALF = /\A[0-9]+\z/
    validates :price,format: {with: VALID_PRICEL_HALF}, length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,greater_than: 300, less_than: 10000000}
  end
end

