class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :favorites
  has_many :fav_shops, through: :favorites, source: :shop

end
