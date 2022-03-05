require 'rails_helper'
require 'capybara/rspec'

describe 'Sign In', type: :feature do
  before :each do
    user = User.new(name: 'Zain', bio: 'Microverse Student', email: 'zain@gmail.com', password: '121212',
                    confirmed_at: '2022-03-05 20:39:13.71382')
    user.save
  end

  it 'I can see the "Log in" button.' do
    visit 'users/sign_in'
    expect(page).to have_button('Log in')
    expect(page).to have_content('Log in')
  end

  it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
    visit 'users/sign_in'
    within('form') do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'after filling in the username and the password with incorrect data.' do
    visit 'users/sign_in'
    within('form') do
      fill_in 'user_email', with: 'nothing@gmail.com'
      fill_in 'user_password', with: 'Wrong'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'When I click the submit button after filling in the username and the password with correct data.' do
    visit 'users/sign_in'
    within('form') do
      fill_in 'user_email', with: 'zain@gmail.com'
      fill_in 'user_password', with: '121212'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end
end
