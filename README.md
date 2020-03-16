# おすすめカフェ投稿アプリ
  おすすめのカフェを投稿、検索できます。
<br>

## 接続方法
- URL : http://18.176.166.55/
- ID/Pass
  - ID: sasugadayo
  - Pass: 12211221
- テスト用アカウント等
    - メールアドレス名: test@test
    - パスワード: hogehoge
    
## 使用技術
- Ruby 2.5.1  
- Rails 5.2.4.1
- Haml/Scss   
- javascript
- GitHub, Git
- MySQL 5.6  
- AWS 
  - EC2  
  - Capstrano  
- Nginx, Unicorn

## アプリ概要
私はカフェ巡りをするのが好きなので、みんなでおすすめのカフェを投稿して、情報を共有し合得るようなサイトを作ろうと思いました。

## 機能一覧
・ユーザー登録、ログイン機能
・投稿、編集、削除機能（タイトル、画像、本文）
・投稿へのコメント機能（Ajax）
・投稿へお気に入り機能
・投稿の検索機能(インクリメンタルサーチ)
・ページネーション(kaminari)
・swiper.jsを用いた投稿画像スライド機能
・pace.jsを用いたページローディング表示
・Basic認証

## 工夫したポイント
・バックエンド
お気に入り機能を導入。中間テーブルを使うことで、ユーザーと投稿に多対多の関係性を持たせてお気に入りに追加するようにした。
・フロントエンド
閲覧者が思わずまた利用したくなるように、swiperというプラグインを導入して、臨場感あるページを作った。

## 今後実装したい機能
・お気に入り機能Ajax導入
・ユーザーフォロー機能


# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :shops
- has_many :comments
- has_many :favorite
- has_many :likes
- has_many :fav_shops, through: :favorites, source: :shop

## shopsテーブル
|Column|Type|Options|
|------|----|-------|
|title||null: false|
|text|string|null: false|
|image|text|null: false|
|user_id|reference|null: false|
### Association
- belongs_to :user
- has_many :comments
- has_many :favorites
- has_many :users, through: :favorites

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|shop_id|refernces|null: false, foreign_key: true|
### Association
- belongs_to :shop
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|shop_id|string|null: false|
|user_id|string|null: false|
### Association
- belongs_to :shop
- belongs_to :user
