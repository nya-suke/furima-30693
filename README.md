# テーブル設計

## usersテーブル

| Column               | Type        | Options                                     |
|:---------------------|------------:|:-------------------------------------------:|
| nickname             | string      | null: false                                 |
| email                | string      | null: false, unique: true, uniqueness: true |
| encrypted_password   | string      | null: false                                 |
| last_name            | string      | null: false                                 |
| first_name           | string      | null: false                                 |
| last_name_kana       | string      | null: false                                 |
| first_name_kana      | string      | null: false                                 |
| birth_date           | date        | null: false                                 |

## Association
 has_many: items
 has_many: user_items

 

 ## user_itemsテーブル
| Column                | Type        | Options                         |
|:---------------------:|------------:|:-------------------------------:|
| user_id               | references  | null: false, foreign_key: true  |
| item_id               | references  | null: false, foreign_key: true  |


## Association
 belongs_to: user
 belongs_to: item
 has_one: addresses



 ## itemsテーブル

| Column                | Type        | Options                         |
|:---------------------:|------------:|:-------------------------------:|
| name                  | string      | null: false                     |
| information           | text        | null: false                     |
| category_id           | integer     | null: false                     |
| status_id             | integer     | null: false                     |
| shipping_fee_id       | integer     | null: false                     |
| prefecture_id         | integer     | null: false                     |
| scheduled_delivery_id | integer     | null: false                     |
| price                 | integer     | null: false                     |


## Association
 has_many: users
 has_one: user_items
 

## addressesテーブル

| Column               | Type        | Options                         |
|:--------------------:|------------:|:-------------------------------:|
| postal_code          | string     | null: false                     |
| prefecture           | string      | null: false                     |
| city                 | string      | null: false                     |
| addresses            | string      | null: false                     |
| building_name        | string      |                                 |
| phone_number         | integer     | null: false                     |


## Association
 belongs_to: user_item