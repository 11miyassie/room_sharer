# RoomSharer

## アプリ紹介

### GIFで見る簡単な使い方
### 物件投稿
[![Image from Gyazo](https://i.gyazo.com/c2ac1acb7cd230a778f00e7e6d3ab430.gif)](https://gyazo.com/c2ac1acb7cd230a778f00e7e6d3ab430)

### コメント
[![Image from Gyazo](https://i.gyazo.com/ed11b14f8f5aaaf01fcc60dda6edb9c7.gif)](https://gyazo.com/ed11b14f8f5aaaf01fcc60dda6edb9c7)

### 検索
[![Image from Gyazo](https://i.gyazo.com/da61d82374ab6e33b2e2cf8e791ddc81.gif)](https://gyazo.com/da61d82374ab6e33b2e2cf8e791ddc81)


## 実装機能

<dl>
  <dt>ユーザー登録 / ログイン / ログアウト</dt>
  <dt>投稿機能 / 編集 / 削除</dt>
  <dt>投稿一覧 / 詳細 / マイページ</dt>
  <dt>コメント機能</dt>
  <dt>検索機能</dt>
</dl>


## 本番環境
http://54.248.208.82/

**テスト用アカウント**
<dl>
  <dt>Basic ID</dt>
  <dd>yusaku</dd>
  <dt>Basic Password</dt>
  <dd>miya0000</dd>
  <dt>アカウントメールアドレス</dt>
  <dd>sample1@sample.com</dd>
  <dt>アカウントパスワード</dt>
  <dd>sample1</dd>
</dl>


## 使用技術（ 開発環境 ）
|                                |                      |
| ------------------------------ | -------------------- |
| バックエンド                     | Ruby, Ruby on Rails  |
| フロントエンド                   | HTML, CSS            |
| データベース                     | MySQL, SequelPro     |
| インフラ                        | AWS(EC2), Capistrano  |
| Webサーバ（ 本番環境 ）           | nginx                 |
| アプリケーションサーバ（ 本番環境 ） | unicorn               |
| ソース管理                       | GitHub, GitHubDesktop |
| テスト                          | RSpec                 |
| エディタ                        | VSCode                |

## 議題や今後実装したい機能

### ペルソナ
- 大学生、20代から30代中間、男女比= 6:4。
- 職業問わず フリーター多め。
- アウトドアタイプが多い印象。
- 海外でシェアハウスを経験した。またはシェアハウスのテレビ番組から影響を受けた。舞台、声優、音楽などとバイトを掛け持ちして生活してるなど、夢を追っていたり、好きなことを日常に多く取り込んで生活してる方が利用すると予想。

### 課題
- 海外でシェアハウスを経験して日本でもやってみたいという方や、金銭的な不安がある方、テレビ番組の影響を受け興味を持った方の要望に応えたいです。
- 海外から日本にワーキングホリデーで来る方向けにも機能を実装していきたいと思っています。

### 実装予定
- チャットルーム作成 & 非同期でのチャット機能
- 登録カラムの追加
- 複数画像投稿機能


# DB設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| gender           | integer| null: false |
| birthday         | date   | null: false |

### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explain       | text       | null: false                    |
| local         | text       | null: false                    |
| price         | integer    | null: false                    |
| building      | string     | null: false                    |
| other         | string     |                                |
| user          | references | null: false, foreign_key: true |
| prefecture    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_one_attached :image
- belongs_to :prefecture


## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


## prefectures テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |

### Association

- has_many :posts
