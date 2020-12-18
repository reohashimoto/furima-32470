class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :item_category_id, presence: true
  validates :price, presence: true
  validates :delivary_fee_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :item_explanation, presence: true
  belongs_to :user
end
