# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "🗑️ Destroying all routes..."
Route.destroy_all

puts 'Creating 20 fake routes...'
20.times do
  route = Route.new(
    address:    "#{Faker::Locations::Australia.location}, #{Faker::Locations::Australia.state}",
    distance: rand(0..15),
    #image: Faker::LoremFlickr.image,
  )
  route.save!
end

puts "🗑️ Destroying all users..."
User.destroy_all

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

puts "✅ Finished!"
