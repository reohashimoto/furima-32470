FurimaのER図

## usersテーブル

| Column              | Type   | Options                  |
|-------------------- |------- |------------------------- |
|email                |string  |null: false, unique: true |
|encrypted_password   |string  |null: false               |
|nickname             |string  |null: false               |
|name_kanji_sei       |string  |null: false               |
|name_kanji_mei       |string  |null:false                |
|name_kana_sei        |string  |null:false                |
|name_kana_mei        |string  |null:false                |
|birthday             |date    |null: false               |

### Association

- has_many :items
- has_many :purchase

## itemsテーブル

| Column         | Type         | Options                      |
|-------------   |-----------   |----------------------------- |
|product_name    |string        |null: false                   |
|category        |string        |null: false                   |
|price           |integer       |null: false                   |
|delivery_fee    |integer       |null: false                   |
|shipping_area   |string        |null: false                   |
|days_to_ship_id |integer       |null: false                   |
|explanation_id  |integer       |null: false                   |
|status_id       |integer       |null: false                   |
|user_id         |references    |null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchases

## purchaseテーブル

| Column       | Type      | Options                      |
|------------- |-------    |----------------------------- |
|user          |references |null: false, foreign_key: true|
|item          |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressテーブル

| Column           | Type      | Options                       |
|-------------     |-------    |------------------------------ |
|postal_code       |integer    |null: false                    |
|prefecture_id     |integer    |null: false                    |
|municipality      |string     |null: false                    |
|address           |integer    |null: false                    |
|building_name     |text       |                               |
|telephone_number  |integer    |null: false                    |
|purchase          |references |null: false, foreign_key: true |

### Association

- belongs_to :purchase






  