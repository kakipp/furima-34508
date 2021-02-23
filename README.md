# データベース設計

## users テーブル

| Column     | Type   | Options                   |
|------------|--------|---------------------------|
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| nick name  | string | null: false               |
| first name | string | null: false               |
| last name  | string | null: false               |
| birth day  | string | null: false               |

### Association

- has_many :buy_users
- has_many :buys, through: buy_users
- has_many :items

## items テーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item name        | string     | null: false                    |
| item description | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery         | string     | null: false                    |
| my area          | string     | null: false                    |
| delivery days    | string     | null: false                    |
| price            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| buy              | references | null: false, foreign_key: true |

### Association

- belong_to :users
- has_one :buys

## buys テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| address | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_many :buy_users
- has_many :users, through: buy_users
- has_one :items
- has_one :addresses

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
| ship city       | string     | null: false                    |
| ship address    | text       | null: false                    |
| ship to address | text       | null: false                    |

### Association

- has_one :buys