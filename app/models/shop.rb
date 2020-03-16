class Shop < ApplicationRecord
  validates :text, presence: true
  validates :title, presence: true, length: { minimum: 1, maximum: 30 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :favorites
  has_many :users, through: :favorites


  def self.search(search)
    return Shop.all unless search
    Shop.where('text LIKE(?)', "%#{search}%")
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
