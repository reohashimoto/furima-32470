FactoryBot.define do
  factory :user_donation do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '080-1234-5767'}
  end
end