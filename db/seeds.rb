# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(
  name: 'user',
  email: 'user@user.com',
  password: 'password',
  password_confirmation: 'password'
)

user_2 = User.create!(
  name: 'user_2',
  email: 'user2@user.com',
  password: 'password',
  password_confirmation: 'password'
)

food = Group.create(name: 'Food', icon: 'https://ibb.co/12vPtLK', user_id: user_1.id)
bills = Group.create(name: 'Bills', icon: 'https://ibb.co/12vPtLK', user_id: user_1.id)
outing = Group.create(name: 'Outing', icon: 'https://ibb.co/12vPtLK', user_id: user_1.id)
travel = Group.create(name: 'Travel', icon: 'https://ibb.co/12vPtLK', user_id: user_1.id)

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
