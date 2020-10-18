# README

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| gender           | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :posts
- has_many :messages
- has_many :rooms, through: :room_users
- has_many :room_users



## posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explain       | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| local         | text       | null: false                    |
| price         | integer    | null: false                    |
| building      | string     | null: false                    |
| other         | string     |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user



## rooms テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |

### Association
- has_many :room_users
- has_many :messages, dependent: :destroy
- has_many :users, through: :room_users. dependent: :destroy



## messsages テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| room         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room



## room_users 中間テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| room         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
