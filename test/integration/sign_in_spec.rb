require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  before(:all) do
    user_1 = User.create(
      name: 'user',
      email: 'email@email.com',
      password: '123456',
      password_confirmation: 'password'
    )
    
    user_2 = User.create(
      name: 'user_2',
      email: 'user2@user.com',
      password: 'password',
      password_confirmation: 'password'
    )
    
    food = Group.create(name: 'Food', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: user_1.id)
    bills = Group.create(name: 'Bills', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: user_1.id)
    outing = Group.create(name: 'Outing', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: user_1.id)
    travel = Group.create(name: 'Travel', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: user_1.id)
    
    burger = Report.create(name: 'Burger', amount: 5, author_id: user_1.id)
    movie = Report.create(name: 'Movie', amount: 10, author_id: user_1.id)
    internet = Report.create(name: 'Internet', amount: 50, author_id: user_1.id)
    rent = Report.create(name: 'Rent', amount: 200, author_id: user_1.id)
    jamaica = Report.create(name: 'I went to Jamaica', amount: 10_000, author_id: user_1.id)
    
    food.reports << burger
    bills.reports << internet
    bills.reports << rent
    outing.reports << jamaica
    outing.reports << movie
  end
  describe 'Contains necessary elements' do
    it 'displays the username input.' do
      visit '/users/sign_in'
      expect(page).to have_field('email')
    end

    it 'displays the password input.' do
      visit '/users/sign_in'
      expect(page).to have_field('password')
    end

    it 'displays the Login button.' do
      visit '/users/sign_in'
      expect(page).to have_button('Log in')
    end
  end

  describe 'when I click the Log In button' do
    it 'Throws error when required fields are empty' do
      visit '/users/sign_in'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  it 'throws error after filling in the username and the password with incorrect data' do
    visit '/users/sign_in'
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: 'email'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'redirects to root after filling in the username and the password with correct data' do
    visit '/users/sign_in'
    fill_in 'email', with: 'admin@admin.com'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
