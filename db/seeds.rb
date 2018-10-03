# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Finding or Creating Users --------- "

user1 = User.create(first_name: "Geoff", last_name: "geoffff", email: "geoff@test.test", password: "12345", password_confirmation: "12345")
user2 = User.create(first_name: "Kyle", last_name: "kyleeee", email: "kyle@test.test", password: "12345", password_confirmation: "12345")
user3 = User.create(first_name: "Alex", last_name: "alexxxx", email: "alex@test.test", password: "12345", password_confirmation: "12345")
user4 = User.create(first_name: "Guy", last_name: "guyyyyyyy", email: "guy@test.test", password: "12345", password_confirmation: "12345")

# BOARDS

puts "Re-creating boards ----------"

user1.boards.create!({
  name: "Favorites",
})

user1.boards.create!({
  name: "Vacations",
})

user2.boards.create!({
  name: "Favorites",
})

user2.boards.create!({
  name: "Vacations",
})

user3.boards.create!({
  name: "Favorites",
})

user3.boards.create!({
  name: "Vacations",
})

user4.boards.create!({
  name: "Favorites",
})

user4.boards.create!({
  name: "Vacations",
})

# CATEGORIES

puts "Re-creating categories ----------"

Category.create!(name: "Africa")
Category.create!(name: "Asia")
Category.create!(name: "Australia")
Category.create!(name: "Europe")
Category.create!(name: "North America")
Category.create!(name: "South America")
Category.create!(name: "Activity")
Category.create!(name: "Adventure")
Category.create!(name: "Art")
Category.create!(name: "Beach")
Category.create!(name: "Breweries/Distillaries")
Category.create!(name: "Cocktails")
Category.create!(name: "Cultural")
Category.create!(name: "Dark")
Category.create!(name: "Desert")
Category.create!(name: "Drinks")
Category.create!(name: "Entertainment")
Category.create!(name: "Family")
Category.create!(name: "Foodie")
Category.create!(name: "LGBTQ")
Category.create!(name: "Hike")
Category.create!(name: "Hip")
Category.create!(name: "Historical")
Category.create!(name: "Hotel")
Category.create!(name: "Island")
Category.create!(name: "Jungle")
Category.create!(name: "Landmarks")
Category.create!(name: "Museum")
Category.create!(name: "Nature")
Category.create!(name: "Natural Wonders")
Category.create!(name: "Off-the-beaten-path")
Category.create!(name: "Park")
Category.create!(name: "Plains")
Category.create!(name: "Resort")
Category.create!(name: "Restaurant")
Category.create!(name: "Road Trip")
Category.create!(name: "Romantic")
Category.create!(name: "Scenic")
Category.create!(name: "Shopping")
Category.create!(name: "Sights")
Category.create!(name: "Solo")
Category.create!(name: "Touristy")
Category.create!(name: "Transportation")
Category.create!(name: "Tropical")
Category.create!(name: "Wildlife")
