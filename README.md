# README

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