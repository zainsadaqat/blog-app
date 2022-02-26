require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  let(:post) { Post.create!(User.first, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0) }

  it 'Update like_counter when someone likes a post' do
    post.likes.create(User.first)
    expect(post.likes_counter).to be(1)
  end
end
