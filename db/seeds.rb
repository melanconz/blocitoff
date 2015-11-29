# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker

  User.create!(
      username: 'creator',
      email: 'zmelan01@gmail.com',
      password: '0penplease1'
  )

  5.times do
    User.create!(
        username: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: 'password'
    )
  end
  users = User.all

  100.times do
    Item.create!(
        user: users.sample,
        name: Faker::Hipster.sentence,
        date: Faker::Date.forward(23)
    )
  end
  items = Item.all


    puts "Seeds finished"
    puts "#{users.count} users created."
    puts "#{items.count} items created."
