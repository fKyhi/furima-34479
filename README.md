## users名

| Column             | Type     | Options        |
| ------------------ | -------- | -------------- |
| nickname           | string   |                |
| email              | string   | unique: true   |
| encrypted_password | string   | unique: true   |
| last_name          | string   | null: false    |
| first_name         | string   | null: false    |
| last_name_kana     | string   | null: false    |
| first_name_kana    | string   | null: false    |
| user_birth_date    | date     | null: false    |


### Association
- has_many :items
- has_many :purchases
- has_many :orders



## items名

| Column                       | Type       | Options           |
| ---------------------------- | ---------- | ----------------- |
| name                         | string     | null: false       |
| item_explain                 | text       | null: false       |
| item_category_id             | integer    | null: false       |
| item_state_id                | integer    | null: false       |
| item_shipping_fee_status_id  | integer    | null: false       |
| prefecture_id                | integer    | null: false       |
| item_scheduled_delivery_id   | integer    | null: false       |
| item_price                   | integer    | null: false       |
| user                         | references | foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase
- has_many :orders


## purchases名

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to: item
- has_many :orders


## orders名

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| order_post_code    | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| order_city         | string     | null: false       |
| order_addressed    | text       | null: false       |
| order_building     | text       |                   |
| order_phone_number | string     | null: false       |
| purchase_id        | references | foreign_key: true |


### Association
- has_many :items
- has_many :purchases
- has_many :orders