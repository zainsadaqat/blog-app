require 'rails_helper'
require 'capybara/rspec'

describe 'User index page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Zain1', bio: 'Microverse Student1',
                      photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      email: 'zain1@gmail.com', password: '121212')
    @user1.save
    @user2 = User.new(name: 'Zain2', bio: 'Microverse Student2',
                      photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      email: 'zain2@gmail.com', password: '121212')
    @user2.save
    @user3 = User.new(name: 'Zain3', bio: 'Microverse Student3',
                      photo: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      email: 'zain3@gmail.com', password: '121212')
    @user3.save
  end

  it 'I can see the name of all users' do
    visit 'users'
    expect(page).to have_content('Zain1')
    expect(page).to have_content('Zain2')
    expect(page).to have_content('Zain3')
  end

  it 'I can see the photo(Link) of all users' do
    visit 'users'
    expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60']")
  end

  it 'I can see the number of post of all users (Everybody have 0, these are recently created users)' do
    visit 'users'
    expect(page).to have_content('Post: 0')
  end

  it 'When I click on a user button, I am redirected to that user show page.' do
    visit 'users'
    click_link('zain1@gmail.com')
    expect(current_path).to eq("/users/#{@user1.id}")
  end
end
