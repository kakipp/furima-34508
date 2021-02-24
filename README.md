# データベース設計

## users テーブル

| Column              | Type   | Options                   |
|---------------------|--------|---------------------------|
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nick_name           | string | null: false               |
| first_name          | string | null: false               |
| first_name_furigana | string | null: false               |
| last_name           | string | null: false               |
| last_name_furigana  | string | null: false               |
| birth_day           | date   | null: false               |

### Association

- has_many :buy_users
- has_many :buys, through: buy_users
- has_many :items

## items テーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| my_area_id       | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| address | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_many :buy_users
- has_many :users, through: buy_users
- has_one :item
- has_one :address

## buy_users テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| buy     | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :buys

## addresses テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| buy             | references | null: false, foreign_key: true |
| address_number  | integer    | null: false                    |
| Prefectures_id  | integer    | null: false                    |
| ship_city       | text       | null: false                    |
| ship_address    | text       | null: false                    |
| ship_to_address | text       | null: false                    |
| telephone       | integer    | null: false, unique: true      |

### Association

- has_one :buy