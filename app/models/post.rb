class Post < ApplicationRecord
  validates :title, presence: { message: 'Title can not be blank' }, length: { maximum: 250, message: 'Post content should be less than 250' }
  validates :text, presence: { message: 'Post content can not be blank' }
  validates :comments_counter, numericality: { message: 'The input should be greater or equal to 0', only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { message: 'The input should be greater or equal to 0', only_integer: true, greater_than_or_equal_to: 0 }
  
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
