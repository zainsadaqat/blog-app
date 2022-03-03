require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.create!(User.first, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'Name should not be nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer higher or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer higher or equal to 0' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
end
