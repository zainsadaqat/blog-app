require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  describe 'Update Likes Counter' do
    let(:user) do
      User.create!(name: 'Zain', photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib',
                   bio: 'Sample', post_counter: 1)
    end
    let(:post) do
      Post.create!(title: 'Post', user_id: user.id, text: 'Lorem Ipsum', comments_counter: 0, likes_counter: 1)
    end

    it 'Updates the likes counter' do
      post.likes.create(:user)
      expect(post.likes_counter).to eq 1
    end
  end
end
