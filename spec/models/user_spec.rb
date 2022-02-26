require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Zain', photo: 'https://images.unsplash.com/photo-1500648767791', bio: 'Software Engineer',
             post_counter: 0)
  end

  before { subject.save }

  it 'Name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be integer higher or equal to 0' do
    subject.post_counter = nil
    expect(subject).to_not be_valid
  end
end
