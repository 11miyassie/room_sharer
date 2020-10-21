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
- has_many :comments



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
- has_many :comments



## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post