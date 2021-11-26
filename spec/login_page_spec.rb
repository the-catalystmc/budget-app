require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :system do
  before(:each) do
    user_1 = User.create(
      name: 'user',
      email: 'user@user.com',
      password: 'password',
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

  describe 'contains' do
    it 'username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_selector("input[type=submit][value='Log In']")
    end
  end

  describe 'when I click the submit button' do
    it 'after filling in the username and the password with incorrect data, I get a detailed error' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'after filling in the username and the password with correct data, I am redirected to the root page' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      expect(page).to have_content('CATEGORIES')
    end

    it 'should show me the logout button' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      expect(page).to have_selector('svg')
    end
  end
end
