require 'rails_helper'

RSpec.describe 'Groups', js: true, type: :system do
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
    it 'title' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      expect(page).to have_content('CATEGORIES')
    end

    it 'links' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      expect(page).to have_button('NEW CATEGORY')
    end
  end

  describe 'when I click the Add category button' do
    it 'I get a page with a form to add a category' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      click_button 'NEW CATEGORY'
      expect(page).to have_content('ADD CATEGORY')
      expect(page).to have_field('Name')
    end
  end

  describe 'when I click the Save button in an add category form' do
    it 'I get the categories page with the added category' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      click_button 'NEW CATEGORY'
      fill_in 'Name', with: 'Electronics'
      click_button 'Save'
      expect(page).to have_content('Electronics')
    end
  end
end
