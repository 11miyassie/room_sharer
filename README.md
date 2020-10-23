
洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
データベース設計	ER図等を添付しましょう。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。


# RoomSharer

# アプリ紹介

## 実装機能

<dl>
  <dt>ユーザー登録 / ログイン / ログアウト</dt>
  <dd>コメントしたい、部屋を貸したい人向けです！</dd>
  <dt>投稿機能 / 編集 / 削除</dt>
  <dd>部屋を貸したい人向けです！</dd>
  <dt>投稿一覧 / 詳細</dt>
  <dd>部屋を借りたい人向けです！</dd>
  <dt>コメント機能</dt>
  <dd>上京予定だけど遠方にいたり、載っていない情報を質問したい人でも安心していただけます！</dd>
</dl>

## 実際使ってみましょう！

[https://room-sharer.herokuapp.com/](url)


<dl> **テスト用アカウント**
  <dt>Basic ID</dt>
  <dd>yusaku</dd>
  <dt>Basic Password</dt>
  <dd>miya0000</dd>
  <dt>アカウントメールアドレス</dt>
  <dd>sample1@sample.com</dd>
  <dt>アカウントパスワード</dt>
  <dd>sample1</dd>
</dl>

- ヘッダーから新規登録、ログインボタンがあるのでクリックするとそれぞれのページに移動します
- ログインしてる状態だと部屋を貸すボタンと、コメント機能を使えるようになります
- ヘッダーから部屋を貸すボタンを押すと投稿フォームに移動するので、情報を記入し投稿してみましょう
- 投稿するとトップページに戻り、トップページには投稿した部屋の情報が表示されているのでクリックしてみましょう
- 詳細画面にはトップページに表示されていない細かな情報や、コメントのフォームがあります。なにか打って送信ボタンを押してみましょう
- 最後に、ログアウトして投稿物の詳細画面に移動すると、コメント機能が使えなくなっていることがわかります
- 説明は以上です。


# 解決したいこと

## ペルソナ
- 大学生、20代から30代中間、男女比= 6:4。
- 職業問わず アルバイター多め。
- アウトドアタイプが多い印象。
- 海外でシェアハウスを経験した。またはシェアハウスのテレビ番組から影響を受けた。舞台、声優、音楽などとバイトを掛け持ちして生活してるなど、夢を追っていたり、好きなことを日常に多く取り込んで生活してる方が利用すると予想。

## 課題
- 海外でシェアハウスを経験して日本でもやってみたいという方や、金銭的な不安がある方、テレビ番組の影響を受け興味を持った方の要望に応えたいです









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
