class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture, :municipality, :address, :building_name, :telephone_number

  with_options presence: true do
     validates :address, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { order_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :telephone_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  end

 def save
  purchase = Purchase.create(user: user, item: item)
  Address.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number,purchase_id: purchase.id)
 end
end