# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "🗑️ Destroying all routes..."
Route.destroy_all

puts "🗑️ Destroying all chatrooms..."
Chatroom.destroy_all

puts "🗑️ Destroying all users..."
User.destroy_all

routes = [
  { address: "Bondi to Coogee Walk, Sydney, NSW", distance: 6.0 },
  { address: "Albert Park Lake, Melbourne, VIC", distance: 4.8 },
  { address: "Kangaroo Point Cliffs, Brisbane, QLD", distance: 5.0 },
  { address: "Kings Park and Botanic Garden, Perth, WA", distance: 7.0 },
  { address: "Torrens River, Adelaide, SA", distance: 8.4 }
]

puts "Creating routes..."
routes.each do |route|
  Route.create!(route)
end

puts "Creating users..."
5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    address: Faker::Address.full_address
  )
end

puts "Creating chatrooms..."
Chatroom.create!(
  user_one_id: User.all.sample.id,
  user_two_id: User.all.sample.id
)


puts "✅ Finished!"
