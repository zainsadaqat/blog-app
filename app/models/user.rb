class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def recent_posts
    Post.order(id: :desc).take(3)
  end
end
