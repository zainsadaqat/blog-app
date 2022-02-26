class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  belongs_to :user, class_name: 'User'
  has_many :likes
  has_many :comments

  def update_posts_counter
    user.update(posts_counter: user.posts.length)
  end

  def recent_comments
    Comment.order(id: :desc).take(5)
  end
end
