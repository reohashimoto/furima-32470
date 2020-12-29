class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :token

  with_options presence: true do
     validates :address
    validates :prefecture_id, numericality: { order_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :telephone_number, format: { with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

 def save
  purchase = Purchase.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number,purchase_id: purchase.id)
 end
end