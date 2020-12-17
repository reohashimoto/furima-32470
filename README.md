FurimaのER図

## usersテーブル

| Column              | Type   | Options                  |
|-------------------- |------- |------------------------- |
|email                |string  |null: false, unique: true |
|encrypted_password   |string  |null: false               |
|nickname             |string  |null: false               |
|name(姓)              |string  |null: false              |
|name(名)              |string  |null:false               |
|name(セイ)            |string  |null:false                |
|name(メイ)            |string  |null:false                |
|birthday             |date    |null: false               |

### Association

- has_many :items
- has_many :purchase

## itemsテーブル

| Column       | Type      | Options                      |
|------------- |-------    |----------------------------- |
|product_name  |text       |null: false                   |
|category      |string     |null: false                   |
|price         |integer    |null: false                   |
|delivery_fee  |integer    |null: false                   |
|shipping_area |string     |null: false                   |
|days_to_ship  |date       |null: false                   |
|explanation   |text       |null: false                   |
|status        |text       |null: false                   |
|user_id       |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase

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






  