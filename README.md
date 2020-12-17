FurimaのER図

## usersテーブル

| Column    | Type   | Options    |
|---------- |------- |----------- |
|email      |string  |null: false |
|password   |string  |null: false |
|nickname   |string  |null: false |
|name       |string  |null: false |
|birthday   |date    |null: false |

### Association

- has_many :items
- has_many :purchase

## itemsテーブル

| Column       | Type      | Options                      |
|------------- |-------    |----------------------------- |
|product_name  |text       |null: false                   |
|category      |string     |null: false                   |
|price         |integer    |null: false                   |
|explanation   |text       |null: false                   |
|status        |text       |null: false                   |
|user_id       |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :purchases

## purchaseテーブル

| Column       | Type      | Options                      |
|------------- |-------    |----------------------------- |
|user          |references |null: false, foreign_key: true|
|item          |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address
- has_one :credit

## shipping_addressテーブル

| Column           | Type      | Options                       |
|-------------     |-------    |------------------------------ |
|postal_code       |integer    |null: false                    |
|prefecture        |string     |null: false                    |
|municipality      |string     |null: false                    |
|address           |integer    |null: false                    |
|building_name     |text       |                               |
|telephone_number  |integer    |null: false                    |
|purchase          |references |null: false, foreign_key: true |

### Association

- belongs_to :purchase

## creditテーブル

| Column           | Type      | Options                       |
|-------------     |-------    |------------------------------ |
|card_number       |integer    |null: false                    |
|expiration date   |date       |null: false                    |
|security_code     |integer    |null: false                    |
|purchase          |reference  |null: false, foreign_key: true |

### association

- belongs_to :purchase


