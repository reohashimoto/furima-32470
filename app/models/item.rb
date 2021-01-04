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
      validates :item_category_id, numericality: { other_than: 1, message: "Select" }
      validates :product_condition_id, numericality: { other_than: 1, message: "Select" }
      validates :delivery_fee_id, numericality: { other_than: 1, message: "Select" }
      validates :shipping_area_id, numericality: { other_than: 1, message: "Select" }
      validates :days_to_ship_id, numericality: { other_than: 1, message: "Select" }
  end
  belongs_to :user
  has_one_attached :image
  has_one :purchase
end
