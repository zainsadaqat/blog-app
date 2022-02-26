class User < ApplicationRecord
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'

  def recent_posts
    Post.order(id: :desc).take(3)
  end
end
