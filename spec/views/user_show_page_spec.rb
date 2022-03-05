require 'rails_helper'
require 'capybara/rspec'

describe 'User profile page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Zain1', bio: 'Microverse Student1',
                      photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      email: 'zain1@gmail.com', password: '121212')
    @user1.save

    @post1 = Post.create(user_id: @user1.id, title: 'First Post', text: 'This is a test 1')
    Post.create(user_id: @user1.id, title: 'Second Post', text: 'This is a test 2')
    Post.create(user_id: @user1.id, title: 'Third Post', text: 'This is a test 3')
  end

  it 'I can see the users profile picture' do
    visit "users/#{@user1.id}"
    expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60']")
  end

  it 'I can see the users name' do
    visit "users/#{@user1.id}"
    expect(page).to have_content('Zain1')
  end

  it 'I can see the users bio.' do
    visit "users/#{@user1.id}"
    expect(page).to have_content('Microverse Student1')
  end

  it 'When I click a users post, it redirects me to that posts show page.' do
    visit "users/#{@user1.id}"
    click_link("post_#{@post1.id}")
    expect(current_path).to eq("/users/#{@user1.id}/posts/#{@post1.id}")
  end
end
