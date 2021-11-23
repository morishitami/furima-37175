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
| birthday_yyyy      | date   | null: false               |
| birthday_m         | date   | nill: false               |
| birthday_d         | date   | nill: false               |

### Association

- has_many :items
- has_one  :buyer
- has_one  :buyer_address

## itemsテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| postage     | string     | null: false                    |
| post_area   | string     | null: false                    |
| days        | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one   :buyer
- has_one   :buyer_address
- belong_to :user

## buyerテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one   :buyer_address

## buyer_addressテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| postal_code | string     | null: false                    |
| state       | string     | null: false                    |
| city        | string     | null: false                    |
| line1       | string     | null: false                    |
| line2       | string     |                                |
| phone       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| buyer       | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- belong_to :buyer