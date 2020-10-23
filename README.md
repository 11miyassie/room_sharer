アプリケーション名	
アプリケーション概要	このアプリケーションでできることを記述しましょう。
URL	デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
テスト用アカウント	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
利用方法	このアプリケーションの利用方法を説明しましょう。
目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
データベース設計	ER図等を添付しましょう。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

誤字脱字が残っている
マークダウンが正しく適用されていない
「です・ます調」と「だ・である調」が混在して統一されていない
ローカルで編集した内容をPushしていない（またはmasterブランチに反映されていない）

# RoomSharer
https://room-sharer.herokuapp.com/

# アプリ紹介

## 実装機能

<dl>
  <dt>ユーザー登録 / ログイン / ログアウト</dt>
  <dd>コメントしたい、投稿したい人向け！</dd>
  <dt>投稿機能 / 編集 / 削除</dt>
  <dd>部屋を貸したい人向け！</dd>
  <dt>投稿一覧 / 詳細</dt>
  <dd>部屋を借りたい人向け！</dd>
  <dt>コメント機能</dt>
  <dd>上京予定だけど遠方にいたり、載っていない情報を質問したりなども安心していただけます！</dd>
</dl>

ペルソナ{
・大学生、20代から30代中間、男女比= 6:4。テラスハウスなどに影響される年齢層がメイン
・職業問わず アルバイター多め。
・アウトドアタイプが多い印象。
・好きなこと(夢追いなど)を日常に多く取り込んで生活してる。
	}

課題{
・地域はお互いの条件をマッチさせたい
=>根幹となるシステムだから =>ユーザーの持つ都道府県データごとに分けて、エリアごとで見れるようにする 

・質問などができるようにしたい
=>住むところは絶対質問したいことがあるから =>チャットシステム

家賃を大幅カットできる => 大学生やアルバイターの経済的不安を解消するため
	}








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
- has_many :comments, dependent: :destroy
- has_one_attached :image


## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
