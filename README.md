# テーブル設計

## usersテーブル

| Column               | Type        | Options      |
|:---------------------|------------:|:------------:|
| nickname             | string      | null: false  |
| email                | string      | null: false  |
| encrypted_password   | string      | null: false  |
| last_name            | string      | null: false  |
| first_name           | string      | null: false  |
| last_name_kana       | string      | null: false  |
| first_name_kana      | string      | null: false  |
| birth_date           | string      | null: false  |

## Association
 has_many: sell_items
 has_many: purchase_items

 

## purchase_itemsテーブル

| Column               | Type        | Options                         |
|:--------------------:|------------:|:-------------------------------:|
| token                | string      | null: false                     |
| postal_code          | integer     | null: false                     |
| prefecture           | string      | null: false                     |
| city                 | string      | null: false                     |
| addresses            | integer     | null: false                     |
| building_name        | string      |                                 |
| phone_number         | integer     | null: false                     |
| user_id              | references  | null: false, foreign_key: true  |
| item_id              | references  | null: false, foreign_key: true  |

## Association
 belongs_to: users
 belongs_to: sell_items

 ## purchase_itemsテーブル

| Column               | Type        | Options                         |
|:--------------------:|------------:|:-------------------------------:|
| image                | string      | null: false                     |
| name                 | string      | null: false                     |
| information          | text        | null: false                     |
| category             | string      | null: false                     |
| status               | string      | null: false                     |
| shipping_fee         | string      | null: false                     |
| prefecture           | string      | null: false                     |
| scheduled_delivery   | string      | null: false                     |
| price                | integer     | null: false                     |
| user_id              | references  | null: false, foreign_key: true  |


## Association
 has_one: purchase_items
 belongs_to: users
