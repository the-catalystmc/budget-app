require 'rails_helper'

RSpec.describe Report, js: true, type: :model do
  before(:each) do
    @user_1 = User.create(
      name: 'user',
      email: 'user@user.com',
      password: 'password',
      password_confirmation: 'password'
    )

    @user_2 = User.create(
      name: 'user_2',
      email: 'user2@user.com',
      password: 'password',
      password_confirmation: 'password'
    )

    @food = Group.create(name: 'Food', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: @user_1.id)
    @bills = Group.create(name: 'Bills', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: @user_1.id)
    @outing = Group.create(name: 'Outing', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: @user_1.id)
    @travel = Group.create(name: 'Travel', icon: 'https://i.ibb.co/ysfZcX5/budget.png', user_id: @user_1.id)

    @burger = Report.create(name: 'Burger', amount: 5, author_id: @user_1.id)
    @movie = Report.create(name: 'Movie', amount: 10, author_id: @user_1.id)
    @internet = Report.create(name: 'Internet', amount: 50, author_id: @user_1.id)
    @rent = Report.create(name: 'Rent', amount: 200, author_id: @user_1.id)
    @jamaica = Report.create(name: 'I went to Jamaica', amount: 10_000, author_id: @user_1.id)

    @food.reports << @burger
    @bills.reports << @internet
    @bills.reports << @rent
    @outing.reports << @jamaica
    @outing.reports << @movie
  end

  it 'name is present' do
    expect(@burger).to be_valid
    expect(@movie).to be_valid
    expect(@internet).to be_valid
  end

  it 'name should be present' do
    @burger.name = nil
    expect(@burger).to_not be_valid
  end

  it 'amount should be present' do
    @burger.amount = nil
    expect(@burger).to_not be_valid
  end

  it 'author_id should be present' do
    @burger.author_id = nil
    expect(@burger).to_not be_valid
  end
end
