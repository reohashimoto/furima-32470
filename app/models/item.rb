class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :product_name
    validates_inclusion_of :price, in: 300..9999999
    validates :item_explanation
    validates :image
      validates :item_category_id, numericality: { order_than: 1 }
      validates :product_condition_id, numericality: { order_than: 1 }
      validates :delivery_fee_id, numericality: { order_than: 1 }
      validates :shipping_area_id, numericality: { order_than: 1 }
      validates :days_to_ship_id, numericality: { order_than: 1 }
  end
  belongs_to :user
  has_one_attached :image
end
