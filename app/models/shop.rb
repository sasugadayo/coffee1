class Shop < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, length: { minimum: 1, maximum: 30 }

  def self.search(search)
    return Shop.all unless search
    Shop.where('text LIKE(?)', "%#{search}%")
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
