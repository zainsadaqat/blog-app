class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
