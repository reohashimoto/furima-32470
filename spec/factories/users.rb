FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    name_kanji_sei {"あいうえお"}
    name_kanji_mei {"あいうえお"}
    name_kana_sei {"アイウエオ"} 
    name_kana_mei {"アイウエオ"}
    birthday {"2000-01-01"}
  end
end
