## users名

| Column           | Type     | Options        |
| ---------------- | -------- | -------------- |
| nickname         | string   | unique: true   |
| email            | string   | unique: true   |
| password         | string   | unique: true   |
| last_name        | string   | null: false    |
| first_name       | string   | null: false    |
| last_name_kana   | string   | null: false    |
| first_name_kana  | string   | null: false    |
| user_birth_year  | date     | null: false    |
| user_birth_month | date     | null: false    |
| user_birth_date  | date     | null: false    |


### Association
- has_many :items
- has_many :purchases
- has_many :orders



## items名

| Column                    | Type       | Options           |
| ------------------------- | ---------- | ----------------- |
| item_name                 | string     | null: false       |
| item_explain              | text       | null: false       |
| item_category             | string     | null: false       |
| item_state                | string     | null: false       |
| item_shipping_fee_status  | string     | null: false       |
| item_prefecture           | string     | null: false       |
| item_scheduled_delivery   | integer    | null: false       |
| item_price                | integer    | null: false       |
| user_id                   | references | foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase
- has_many :orders


## purchases名

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to: item
- has_many :orders


## orders名

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| order_post_code    | integer    | null: false       |
| order_prefecture   | string     | null: false       |
| order_city         | string     | null: false       |
| order_addressed    | text       | null: false       |
| order_building     | text       |                   |
| order_phone_number | string     | null: false       |
| user_id            | references | foreign_key: true |
| item_id            | references | foreign_key: true |
| purchase_id        | references | foreign_key: true |


### Association
- has_many :items
- has_many :purchases
- has_many :orders