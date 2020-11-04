# アプリケーション名 Sharee

# アプリケーション概要
自分で部屋を作り、指定した相手と家にあるホワイトボードに記入する様に  メモをシェアするアプリ  
URL	https://sharee3.herokuapp.com/  
テスト用アカウント	ユーザ名 テストです email test@12345 password test12345  
作った部屋を見る用  ユーザ名 見る人 email see@12345 password see12345  

# 利用方法  	
アカウントを作成していただいてログインしていただくと、メモを作成するというボタンのあるページにいくので、そのボタンを押して、
次のページで部屋の名前とメモを共有したいユーザーを選択して作成していただくと、指定したユーザとのメモのシェアが始まります。  

# 目指した課題解決
このアプリケーションを通じて、僕はリアルタイムで情報を伝達することができる、今の世の中は便利である反面、  
伝達する相手側の状況を考えなければならないという課題があると思いました。  
また緊急な連絡はリアルタイムで伝えるべきですが、業務の引き継ぎの際に必要な情報や買うべきものなどの共有などは,  
リアルタイムで共有する必要がないのです。なので必要な時に情報を得れる環境の方が双方にとってストレスなく生活できるので、
メモをシェアするという形で家にあるホワイトボードのようなアプリを作り、この課題を解決しました。

# 洗い出した要件 	
・ ユーザー管理機能  
・ ルーム作成機能  
・ ルーム削除機能  
・ メモ表示機能  
・ メモ削除機能  


 # ユーザー管理機能
  パスワードは確認用も含め二回入力するようにしました  
  GIF ![user_app](https://user-images.githubusercontent.com/70442362/98076453-9e5ef500-1eb1-11eb-81bf-02ce4cf4a29c.gif)  
  ユーザー名を登録をした後でも、ユーザー名を変更できるようにしました  
  GIF ![user_edit](https://user-images.githubusercontent.com/70442362/98076357-75d6fb00-1eb1-11eb-93ee-150629d976b0.gif)  


  # ルーム作成機能  
  一つのルームに登録する人数を＋ボタンーボタンで調整できるようにしました  
  また登録するユーザーを増やす際に＋ーボタンをjavascriptを使って作ることで  
  自由にフォームを増やせるようにしました  
  GIF ![create_room](https://user-images.githubusercontent.com/70442362/98076496-b59de280-1eb1-11eb-89a7-03542a72cf24.gif)  

  # ルーム削除機能  
  必要のなくなったメモだけでなくルームごと削除できるようにして、管理をしやすくしました  
  GIF ![room_delete](https://user-images.githubusercontent.com/70442362/98076578-d7976500-1eb1-11eb-87ec-ba6e1580d568.gif)  

 # メモ投稿機能
  投稿したユーザー名と日付と時間を一つのメモの上段に配置することでいつ誰がこのメモを書いたのかわかりやすくしました。  
  GIF ![memo](https://user-images.githubusercontent.com/70442362/98076604-e8e07180-1eb1-11eb-84cd-4f6ba94c5bd5.gif)  


 # メモ削除機能  
  投稿したメモに削除ボタンをつけて、ルームごと消すのではなく、消したいメモだけ削除できるようにしました.  
  GIF ![memo_delete](https://user-images.githubusercontent.com/70442362/98076664-0d3c4e00-1eb2-11eb-9fb3-d96bb1ee8c59.gif)  


# 追加実装予定
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

