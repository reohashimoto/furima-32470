FactoryBot.define do
  factory :item do
    product_name {Faker::Lorem.sentence}
    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
    item_category_id {2}
    price {5000}
    delivery_fee_id {2}
    shipping_area_id {2}
    days_to_ship_id {2}
    item_explanation {Faker::Lorem.sentence}
    product_condition_id {2}
    association :user
  end
end
