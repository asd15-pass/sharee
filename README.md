アプリケーション名 Sharee

アプリケーション概要	

自分で部屋を作り、指定した相手と家にあるホワイトボードに記入する様にメモをシェアするアプリ

URL	https://sharee3.herokuapp.com/
テスト用アカウント	ユーザ名 テストです email test@12345 password test12345
作った部屋を見る用  ユーザ名 見る人 email see@12345 password see12345

利用方法	アカウントを作成していただいてログインしていただくと、メモを作成するというボタンのあるページにいくので、そのボタンを押して、
次のページで部屋の名前とメモを共有したいユーザーを選択して作成していただくと、指定したユーザとのメモのシェアが始まります。

目指した課題解決	
僕はこのアプリでこのアプリケーションを通じて、家族、恋人、ルームメイトなど生活を共にする人がいる人の、
情報を共有したいけど、リアルタイムで共有することにストレスを感じている方の課題を解決したいと思いました。

洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
・　ユーザー管理機能
・　ルーム作成機能
・　ルーム削除機能
・　メモ表示機能
・　メモ削除機能


- ユーザー管理機能 
  パスワードは確認用も含め二回入力するようにしました GIF user_app.gif
  ユーザー名を登録をした後は、何回でも変更できるようにしました GIF user_edit.gif 

- ルーム作成機能 
  一つのルームに登録する人数を＋ボタンーボタンで調整できるようにしました
  また登録するユーザーを増やす際に＋ーボタンをjavascriptを使って作ることで
  自由にフォームを増やせるるようにした
  GIF create_room.gif

- ルーム削除機能 
  必要のなくなったメモだけでなくルームごと削除できるようにして、管理をしやすくしました
  GIF room_delete.gif

- メモ投稿機能 
  投稿したユーザー名と日付と時間を一つのメモの上段に配置することでいつ誰がこのメモを書いたのかわかりやすくしました。
  GIF memo.gif

- メモ削除機能 
  投稿したメモに削除ボタンをつけて、消したいメモだけ削除できるようにしました。
  GIF memo_delete.gif

追加実装予定
ユーザー招待機能 , SNS認証

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :memos

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :memos

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## memos テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

<!-- ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど） -->
