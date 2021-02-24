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
- has_many :items

## items テーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| my_area_id       | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :buy_user


## buy_users テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| buy_user        | references | null: false, foreign_key: true |
| address_number  | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| ship_city       | string     | null: false                    |
| ship_address    | string     | null: false                    |
| ship_to_address | string     |                                |
| telephone       | integer    | null: false, unique: true      |

### Association

- belong_to :buy_user