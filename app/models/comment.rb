class Comment < ApplicationRecord
  belongs_to :shop  # shopsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end