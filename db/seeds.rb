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

# LOCATIONS

puts "Creating locations ----------"

location1 = Location.create(city: "Vancouver", location: "Kits Beach", lat: 492827, long: -1231207, google_id: 1)
location2 = Location.create(city: "Paris", location: "Eiffel Tower", lat: 488566, long: 23522, google_id: 2)
location3 = Location.create(city: "Beijing", location: "Tiananmen Square", lat: 399042, long: 1164074, google_id: 3)
location4 = Location.create(city: "Sydney", location: "Opera House", lat: -338688, long: 1512093, google_id: 4)

# POSTS

puts "Re-creating Posts -----------"

Post.destroy_all

user1.posts.create!({
  note: "the poopiest water in town",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Kits beach",
  location_id: location1.id,
})

user1.posts.create!({
  note: "some pizza",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "PIIZZAA",
  location_id: location2.id,
})

user1.posts.create!({
  note: "Stuff happens here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Stuff",
  location_id: location3.id,
})

user1.posts.create!({
  note: "They have that cross thing here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Commercial drive",
  location_id: location4.id,
})

user2.posts.create!({
  note: "the poopiest water in town",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Kits beach",
  location_id: location1.id,
})

user2.posts.create!({
  note: "some pizza",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "PIIZZAA",
  location_id: location2.id,
})

user2.posts.create!({
  note: "Stuff happens here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Stuff",
  location_id: location3.id,
})

user2.posts.create!({
  note: "They have that cross thing here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Commercial drive",
  location_id: location4.id,
})

user3.posts.create!({
  note: "the poopiest water in town",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Kits beach",
  location_id: location1.id,
})

user3.posts.create!({
  note: "some pizza",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "PIIZZAA",
  location_id: location2.id,
})

user3.posts.create!({
  note: "Stuff happens here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Stuff",
  location_id: location3.id,
})

user3.posts.create!({
  note: "They have that cross thing here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Commercial drive",
  location_id: location4.id,
})

user4.posts.create!({
  note: "the poopiest water in town",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Kits beach",
  location_id: location1.id,
})

user4.posts.create!({
  note: "some pizza",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "PIIZZAA",
  location_id: location2.id,
})

user4.posts.create!({
  note: "Stuff happens here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Stuff",
  location_id: location3.id,
})

user4.posts.create!({
  note: "They have that cross thing here",
  photo_url: "https://kittenrescue.org/wp-content/uploads/2017/03/KittenRescue_KittenCareHandbook.jpg",
  title: "Commercial drive",
  location_id: location4.id,
})



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

Category.create!(name: "Beach")
Category.create!(name: "Nature")
Category.create!(name: "Hashtag")
Category.create!(name: "Sights")
Category.create!(name: "Restaurant")
Category.create!(name: "Hotel")
Category.create!(name: "Food")
Category.create!(name: "Water")
Category.create!(name: "Sun")
Category.create!(name: "Ocean")
Category.create!(name: "Boat")

# COMMENTS

puts "Re-creating comments ----------"

Comment.create!(text: "This is a comment", user_id: 1, post_id: 1)
Comment.create!(text: "This is a another comment", user_id: 1, post_id: 2)
Comment.create!(text: "This is a comment I guess", user_id: 1, post_id: 2)
Comment.create!(text: "This is a good comment", user_id: 1, post_id: 3)
Comment.create!(text: "This is a bad comment", user_id: 1, post_id: 4)
Comment.create!(text: "This is a squirrel comment", user_id: 1, post_id: 4)
Comment.create!(text: "This is a shark comment", user_id: 1, post_id: 4)
Comment.create!(text: "This is a duck comment", user_id: 1, post_id: 4)
Comment.create!(text: "This is a goose comment", user_id: 1, post_id: 5)
Comment.create!(text: "This is a cucumber comment", user_id: 1, post_id: 6)
Comment.create!(text: "This is a abstract comment", user_id: 1, post_id: 6)
Comment.create!(text: "This is a obtuse comment", user_id: 1, post_id: 7)
Comment.create!(text: "This is a rational comment", user_id: 1, post_id: 8)
Comment.create!(text: "This is a radical comment", user_id: 1, post_id: 9)
Comment.create!(text: "This is a curious comment", user_id: 1, post_id: 11)
Comment.create!(text: "This is an original comment", user_id: 1, post_id: 11)
Comment.create!(text: "This is an excellent comment", user_id: 1, post_id: 10)
Comment.create!(text: "This is an orange comment", user_id: 1, post_id: 1)
Comment.create!(text: "This is a red comment", user_id: 1, post_id: 1)
Comment.create!(text: "This is a blue comment", user_id: 1, post_id: 1)
Comment.create!(text: "This is a green comment", user_id: 1, post_id: 1)
Comment.create!(text: "This is an evergreen comment", user_id: 1, post_id: 12)
Comment.create!(text: "This is a big comment", user_id: 1, post_id: 13)
Comment.create!(text: "This is a small comment", user_id: 1, post_id: 14)
Comment.create!(text: "This is a gross comment", user_id: 1, post_id: 15)
Comment.create!(text: "This is a unique comment", user_id: 1, post_id: 16)
Comment.create!(text: "This is a poo-pood comment", user_id: 1, post_id: 16)

# Add posts to boards

puts "Adding posts to boards ----------"

BoardItem.create!(post_id: 1, board_id: 1)
BoardItem.create!(post_id: 2, board_id: 1)
BoardItem.create!(post_id: 3, board_id: 2)
BoardItem.create!(post_id: 4, board_id: 2)
BoardItem.create!(post_id: 5, board_id: 3)
BoardItem.create!(post_id: 6, board_id: 3)
BoardItem.create!(post_id: 7, board_id: 4)
BoardItem.create!(post_id: 8, board_id: 4)
BoardItem.create!(post_id: 9, board_id: 5)
BoardItem.create!(post_id: 10, board_id: 5)
BoardItem.create!(post_id: 11, board_id: 6)
BoardItem.create!(post_id: 12, board_id: 6)
BoardItem.create!(post_id: 13, board_id: 7)
BoardItem.create!(post_id: 14, board_id: 7)
BoardItem.create!(post_id: 15, board_id: 8)
BoardItem.create!(post_id: 16, board_id: 8)
BoardItem.create!(post_id: 16, board_id: 1)
BoardItem.create!(post_id: 15, board_id: 1)
BoardItem.create!(post_id: 14, board_id: 2)
BoardItem.create!(post_id: 13, board_id: 2)
BoardItem.create!(post_id: 12, board_id: 3)
BoardItem.create!(post_id: 11, board_id: 3)
BoardItem.create!(post_id: 10, board_id: 4)
BoardItem.create!(post_id: 9, board_id: 4)
BoardItem.create!(post_id: 8, board_id: 5)
BoardItem.create!(post_id: 7, board_id: 5)
BoardItem.create!(post_id: 6, board_id: 6)
BoardItem.create!(post_id: 5, board_id: 6)
BoardItem.create!(post_id: 4, board_id: 7)
BoardItem.create!(post_id: 3, board_id: 7)
BoardItem.create!(post_id: 2, board_id: 8)
BoardItem.create!(post_id: 1, board_id: 8)

# Add categories to posts

puts "Adding categories to posts ----------"

PostCategory.create!(post_id: 1, category_id: 1)
PostCategory.create!(post_id: 1, category_id: 2)
PostCategory.create!(post_id: 1, category_id: 3)
PostCategory.create!(post_id: 1, category_id: 4)
PostCategory.create!(post_id: 1, category_id: 5)
PostCategory.create!(post_id: 1, category_id: 6)
PostCategory.create!(post_id: 1, category_id: 7)
PostCategory.create!(post_id: 2, category_id: 1)
PostCategory.create!(post_id: 3, category_id: 1)
PostCategory.create!(post_id: 4, category_id: 1)
PostCategory.create!(post_id: 5, category_id: 1)
PostCategory.create!(post_id: 6, category_id: 1)
PostCategory.create!(post_id: 7, category_id: 1)
PostCategory.create!(post_id: 7, category_id: 4)
PostCategory.create!(post_id: 8, category_id: 1)
PostCategory.create!(post_id: 9, category_id: 1)
PostCategory.create!(post_id: 10, category_id: 1)
PostCategory.create!(post_id: 11, category_id: 1)
PostCategory.create!(post_id: 11, category_id: 2)
PostCategory.create!(post_id: 12, category_id: 1)
PostCategory.create!(post_id: 13, category_id: 11)
PostCategory.create!(post_id: 14, category_id: 5)
PostCategory.create!(post_id: 15, category_id: 6)
PostCategory.create!(post_id: 16, category_id: 7)
PostCategory.create!(post_id: 16, category_id: 3)
PostCategory.create!(post_id: 16, category_id: 2)
PostCategory.create!(post_id: 16, category_id: 5)
PostCategory.create!(post_id: 16, category_id: 8)
PostCategory.create!(post_id: 16, category_id: 9)
PostCategory.create!(post_id: 15, category_id: 10)
