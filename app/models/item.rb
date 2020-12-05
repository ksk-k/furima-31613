class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :shipping_date_id
    end
    VALID_PRICEL_HALF = /\A[0-9]+\z/
    validates :price,format: {with: VALID_PRICEL_HALF}, length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,greater_than: 299, less_than: 10000000}
  end
end