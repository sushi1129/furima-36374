# テーブル設計

## Usersテーブル

| Column             | Type    | Options                                |
| ------------------ | ------- | -------------------------------------- |
| nickname           | string  | null: false                            |
| email              | string  | null: false, default: "", unique: true |
| encrypted_password | string  | null: false, default: ""               |
| last_name          | string  | null: false                            |
| first_name         | string  | null: false                            |
| last_name_kana     | string  | null: false                            |
| first_name_kana    | string  | null: false                            |
| birthday           | date    | null: false                            |

### Association
- has_many :items
- has_many :order

## Itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| info            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| sipping_cost_id | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| sipping_day_id  | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

※imageはActiveStorageで実装

### Association
- belongs_to :user
- has_one    :order

## Ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## Addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_cade         | string     | null: false                    |
| prefectures_id      | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |
| purchase_management | references | null: false, foreign_key: true |

### Association
- belongs_to :order
