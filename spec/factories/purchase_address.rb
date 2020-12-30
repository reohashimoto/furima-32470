FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id {2}
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '08012345767'}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {2}
  end
end