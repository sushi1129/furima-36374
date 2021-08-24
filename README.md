# テーブル設計

## Usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_many :items
- has_many :buys

## Itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| info         | text       | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| sipping_cost | integer    | null: false                    |
| user_area    | integer    | null: false                    |
| sipping_day  | integer    | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

※imageはActiveStorageで実装

### Association
- belongs_to :user
- has_one :buy

## Buysテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_cade      | integer    | null: false                    |
| prefectures      | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
