require 'rails_helper'
require 'capybara/rspec'

describe 'Post show page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Zain1', bio: 'Microverse Student1',
                         photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                         email: 'zain1@gmail.com', password: '121212')

    @user2 = User.create(name: 'Zain2', bio: 'Microverse Student2',
                         photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                         email: 'zain2@gmail.com', password: '121212')

    @post = Post.create(user_id: @user.id, title: 'First Post', text: 'Lorem Ipsum is a paragraph')

    Comment.create(post_id: @post.id, user_id: @user1.id, text: 'Comment 1')
    Comment.create(post_id: @post.id, user_id: @user1.id, text: 'Comment 2')
    Comment.create(post_id: @post.id, user_id: @user1.id, text: 'Comment 3')
  end

  it 'I can see a posts title.' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('First Post')
  end

  it 'I can see the who wrote the post' do
    visit "users/#{@user1.id}/posts/#{@post.id}"
    expect(page).to have_content('Zain1')
  end

  it 'I can see how many comments the post has.' do
    visit "users/#{@user1.id}/posts/#{@post.id}"
    expect(page).to have_content('Comments: 3')
  end

  it 'I can see the post body.' do
    visit "users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('Lorem Ipsum is a paragraph')
  end

  it 'I can see the name of each commentor' do
    visit "users/#{@user1.id}/posts/#{@post.id}"
    expect(page).to have_content("Name: #{@user1.name}")
  end

  it 'I can see the comment each commentor left.' do
    visit "users/#{@user1.id}/posts/#{@post.id}"
    expect(page).to have_content('Comment: Comment 1')
    expect(page).to have_content('Comment: Comment 2')
    expect(page).to have_content('Comment: Comment 3')
  end
end
