class Shop < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :favorites
  has_many :users, through: :favorites


  def self.search(search)
    return Shop.all unless search
    Shop.where('text LIKE(?)', "%#{search}%")
  end


end
