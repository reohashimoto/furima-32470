class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :days_to_ship

  with_options presence: true do
  validates :product_name
  validates :item_category_id, numericality: { order_than: 1 }
  validates :product_condition_id
  validates :price
  validates :delivery_fee_id
  validates :shipping_area_id
  validates :days_to_ship_id
  validates :item_explanation
  end
  belongs_to :user
end
