## users名

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | unique: true  null: false |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| user_birth_date    | date     | null: false               |


### Association
- has_many :items
- has_many :purchases



## items名

| Column                  | Type       | Options           |
| ----------------------- | ---------- | ----------------- |
| name                    | string     | null: false       |
| explain                 | text       | null: false       |
| category_id             | integer    | null: false       |
| state_id                | integer    | null: false       |
| shipping_fee_status_id  | integer    | null: false       |
| prefecture_id           | integer    | null: false       |
| scheduled_delivery_id   | integer    | null: false       |
| price                   | integer    | null: false       |
| user                    | references | foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase


## purchases名

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :order


## orders名

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| addressed     | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |


### Association
- belongs_to :purchase