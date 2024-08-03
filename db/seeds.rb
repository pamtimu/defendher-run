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

puts "🗑️ Destroying all saved routes..."
SavedRoute.destroy_all

puts "🗑️ Destroying all routes..."
Route.destroy_all


puts "🗑️ Destroying all chatrooms..."
Chatroom.destroy_all

puts "🗑️ Destroying all users..."
User.destroy_all

puts 'Finding routes in Australia...'
Route.create!(
[
    {
        address: "Bondi Beach, Sydney, NSW",
        name: "Bondi to Coogee Coastal Walk",
        distance: 6.0,
        description: "A stunning coastal walk from Bondi Beach to Coogee Beach, featuring breathtaking ocean views, cliffs, and beaches along the way.",
        image: "routes/bondi.jpg",
        latitude: -33.891475,
        longitude: 151.276684
    },
    {
        address: "Albert Park, Melbourne, VIC",
        name: "Albert Park Lake",
        distance: 5.0,
        description: "A flat and scenic loop around Albert Park Lake, offering views of the Melbourne skyline and the tranquil waters of the lake.",
        image: "routes/albert_park_melbourne.jpg",
        latitude: -37.843202,
        longitude: 144.972919
    },
    {
        address: "Kangaroo Point, Brisbane, QLD",
        name: "Kangaroo Point Cliffs",
        distance: 7.0,
        description: "Run along the Brisbane River with stunning views of the city, passing by the iconic Kangaroo Point Cliffs and Story Bridge.",
        image: "routes/brisbane city.jpg",
        latitude: -27.476254,
        longitude: 153.034032
    },
    {
        address: "King’s Park, Perth, WA",
        name: "Kings Park and Botanic Garden",
        distance: 6.0,
        description: "A scenic route through one of the largest inner-city parks in the world, offering panoramic views of Perth and the Swan River.",
        image: "routes/kingspark.jpg",
        latitude: -31.959961,
        longitude: 115.845672
    },
    {
        address: "The Esplanade, Cairns, QLD",
        name: "Cairns Esplanade",
        distance: 3.5,
        description: "A leisurely run along the Cairns Esplanade, with views of the Coral Sea, public art installations, and lush tropical greenery.",
        image: "routes/woman running.jpg",
        latitude: -16.920334,
        longitude: 145.771569
    },
    {
        address: "Mt. Ainslie Drive, Canberra, ACT",
        name: "Mount Ainslie",
        distance: 4.5,
        description: "A challenging run with a rewarding view from the top of Mount Ainslie, overlooking Canberra’s city layout and surrounding nature.",
        image: "routes/canberra.jpg",
        latitude: -35.270714,
        longitude: 149.149361
    },
    {
        address: "Manly Beach, Sydney, NSW",
        name: "Manly to Spit Bridge Walk",
        distance: 10.0,
        description: "A beautiful coastal trail from Manly Beach to Spit Bridge, featuring bushland, hidden coves, and stunning harbour views.",
        image: "routes/manly beach.jpg",
        latitude: -33.795928,
        longitude: 151.282364
    },
    {
        address: "The Tan Track, Melbourne, VIC",
        name: "Royal Botanic Gardens",
        distance: 3.8,
        description: "A popular track around the Royal Botanic Gardens, offering a mix of flat and undulating terrain with picturesque garden views.",
        image: "routes/melbourne.jpg",
        latitude: -37.830481,
        longitude: 144.979795
    },
    {
        address: "South Bank, Brisbane, QLD",
        name: "South Bank and Kangaroo Point",
        distance: 5.5,
        description: "A scenic riverside route along South Bank and the Brisbane River, passing by parklands, cultural sites, and city views.",
        image: "routes/southbank.jpg",
        latitude: -27.478268,
        longitude: 153.028659
    },
    {
        address: "Cottesloe Beach, Perth, WA",
        name: "Cottesloe to Swanbourne Beach",
        distance: 5.0,
        description: "A coastal run along the Indian Ocean from Cottesloe Beach to Swanbourne Beach, known for its clear waters and sandy shores.",
        image: "routes/perth.jpg",
        latitude: -31.997118,
        longitude: 115.751907
    },
    {
        address: "Yarra River, Melbourne, VIC",
        name: "Yarra River Trail",
        distance: 8.0,
        description: "A scenic trail along the Yarra River, providing a peaceful escape from the city with views of the river and surrounding parklands.",
        image: "routes/river.jpg",
        latitude: -37.812648,
        longitude: 144.978364
    },
    {
        address: "Stamford Hill Road, Port Lincoln, SA",
        name: "Lincoln National Park",
        distance: 6.0,
        description: "A rugged trail in Lincoln National Park, offering coastal views, native bushland, and the chance to see local wildlife.",
        image: "routes/port.jpg",
        latitude: -34.781879,
        longitude: 135.929122
    },
    {
        address: "Glenelg Beach, Adelaide, SA",
        name: "Glenelg to Brighton Coastal Trail",
        distance: 8.0,
        description: "A scenic coastal trail from Glenelg to Brighton, featuring sandy beaches, coastal parks, and ocean views.",
        image: "routes/manly beach.jpg",
        latitude: -34.979183,
        longitude: 138.514819
    },
    {
        address: "Hobart, TAS",
        name: "Battery Point to Salamanca Place",
        distance: 4.0,
        description: "A historical route starting from Battery Point, winding through Salamanca Place with its vibrant market and waterfront views.",
        image: "routes/hobart.jpg",
        latitude: -42.889274,
        longitude: 147.330773
    },
    {
        address: "Lake Burley Griffin, Canberra, ACT",
        name: "Lake Burley Griffin Loop",
        distance: 5.0,
        description: "A loop around Lake Burley Griffin, offering serene water views, landscaped parks, and iconic Canberra landmarks.",
        image: "routes/canberra.jpg",
        latitude: -35.291395,
        longitude: 149.129759
    },
    {
        address: "Seacliff Esplanade, Adelaide, SA",
        name: "Seacliff to Marino",
        distance: 5.5,
        description: "A coastal route along Seacliff Esplanade, with stunning views of the ocean, rocky cliffs, and sandy beaches.",
        image: "routes/adelaidebeach.jpg",
        latitude: -35.045524,
        longitude: 138.520328
    },
    {
        address: "New Farm Park, Brisbane, QLD",
        name: "New Farm Park to Teneriffe",
        distance: 4.5,
        description: "A scenic run along the Brisbane River, starting from New Farm Park, through the trendy suburb of Teneriffe, with riverside views and historic landmarks.",
        image: "routes/brisbane city.jpg",
        latitude: -27.468917,
        longitude: 153.053073
    },
    {
        address: "West End, Brisbane, QLD",
        name: "West End to South Brisbane Loop",
        distance: 6.0,
        description: "A cultural route that takes you through the eclectic West End neighborhood, along the river, and into South Brisbane, offering a mix of urban and riverside scenery.",
        image: "routes/brisbanestory.jpg",
        latitude: -27.482789,
        longitude: 153.008296
    },
    {
        address: "Mount Coot-tha, Brisbane, QLD",
        name: "Mount Coot-tha Summit Track",
        distance: 1.9,
        description: "A challenging uphill run to the top of Mount Coot-tha, rewarding runners with panoramic views of Brisbane and the surrounding area.",
        image: "routes/brisbane city.jpg",
        latitude: -27.476114,
        longitude: 152.975306
    },
    {
        address: "Brisbane Botanic Gardens, Mount Coot-tha, Brisbane, QLD",
        name: "Brisbane Botanic Gardens Loop",
        distance: 2.5,
        description: "A relaxing run through the beautiful Brisbane Botanic Gardens at Mount Coot-tha, featuring well-maintained paths and diverse plant collections.",
        image: "routes/woman running 3.jpg",
        latitude: -27.481853,
        longitude: 152.972967
    }
]
)


User.create!(
  first_name: "Admin",
  last_name: "User",
  email: "admin@admin.com",
  password: "123456"
)


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

Route.all.each do |route|
  saved_route = SavedRoute.new()
  saved_route.user = User.first
  saved_route.route = route
  saved_route.save!
end



puts "✅ Finished!"
