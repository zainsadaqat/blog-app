require 'rails_helper'
require 'capybara/rspec'

describe 'posts#index', type: :feature do
  before :each do
    @user = User.create(name: 'Zain', bio: 'Microverse Student',
                        photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        email: 'zain@gmail.com', password: '121212')

    @post = Post.create(user_id: @user.id, title: 'First Post', text: 'Lorem Ipsum is a paragraph')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 1')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 2')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 3')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 4')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 5')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 6')
    Comment.create(post_id: @post.id, user_id: @user.id, text: 'Comment 7')
  end

  it 'I can see the users name' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content('Zain')
  end

  it 'I can see a posts title.' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content('First Post')
  end

  it 'I can see some of the posts body.' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content('Lorem Ipsum is a paragraph')
  end

  it 'I can see how many comments a post has.' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content('Comments: 7')
  end

  it 'When I click on a post, it redirects me to that posts show page.' do
    visit "users/#{@user.id}/posts"
    click_link("post_#{@post.id}")
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
  end
end
