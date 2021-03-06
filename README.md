# README

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| lastname           | string | null: false               |
| firstname          | string | null: false               |
| lastname_kana      | string | null: false               |
| firstname_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many  :buyers

## itemsテーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| title          | string     | null: false                    |
| explanation    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| postage_id     | integer    | null: false                    |
| state_id       | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one   :buyer
- belong_to :user

## buyersテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one   :address

## Addressesテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| postal_code | string     | null: false                    |
| state_id    | integer    | null: false                    |
| city        | string     | null: false                    |
| line1       | string     | null: false                    |
| line2       | string     |                                |
| phone       | string     | null: false                    |
| buyer       | references | null: false, foreign_key: true |

### Association

- belong_to :buyer