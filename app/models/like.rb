class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'User'

  def update_likes_counter
    Post.update(likes_counter: post.likes.length)
  end
end
