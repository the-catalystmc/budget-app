require 'rails_helper'

RSpec.describe 'Reports', js: true, type: :system do
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
      click_link 'Food'
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'links' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      click_link 'Food'
      expect(page).to have_content('New Transaction')
    end
  end

  describe 'contains' do
    it 'contracts' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      click_link 'Food'
      expect(page).to have_content('Burger')
    end
  end

  describe 'when I click the New Transaction button' do
    it 'I get a page with a form to add a transaction' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      click_link 'Food'
      click_link 'New Transaction'
      expect(page).to have_content('ADD TRANSACTION')
    end
  end
end
