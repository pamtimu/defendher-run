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

routes = [
  { address: "Bondi to Coogee Walk, Sydney, NSW", distance: 6.0 },
  { address: "Albert Park Lake, Melbourne, VIC", distance: 4.8 },
  { address: "Kangaroo Point Cliffs, Brisbane, QLD", distance: 5.0 },
  { address: "Kings Park and Botanic Garden, Perth, WA", distance: 7.0 },
  { address: "Torrens River, Adelaide, SA", distance: 8.4 },
  { address: "Eagle St. Pier, downtown Brisbane", distance: 4.0 },
  { address: "Orleigh Park, West End, Brisbane", distance: 5.0 },
  { address: "New Farm Park, Brisbane", distance: 6.0 },
  { address: "South Bank Parklands, Brisbane", distance: 7.0 },
  { address: "Brisbane Riverwalk, Brisbane", distance: 8.0 },
  { address: "City Botanic Gardens, Brisbane", distance: 9.0 },
  { address: "Mount Coot-tha, Brisbane", distance: 10.0 },
  { address: "Daisy Hill Conservation Park, Brisbane", distance: 11.0 },


]

puts "Creating routes..."
routes.each do |route|
  Route.create!(route)
end

puts "✅ Finished!"
