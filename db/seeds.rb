# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "Gavin O'Connor", location: "Brooklyn, NY", age: 36, relationship: "Engaged", gender: "Male")
User.create!(username: "Tim Koar", location: "Interlaken, NJ", age: 26, relationship: "Single", gender: "Male")
User.create!(username: "Jennifer Oh", location: "Brooklyn, NY", age: 24, relationship: "In a relationship", gender: "Female")
User.create!(username:"Jed Spears", location:"New York City, NY", age: 25, relationship: "Single" , gender: "Male")
User.create!(username:"Carly Pecora", location: "New York City, NY", age: 22, relationship: "Single", gender: "Female")
User.create!(username: "Jake Lovitz", location: "New York City, NY", age: 25, relationship: "In a relationship", gender: "Male")
User.create!(username: "Jessica Lin", location: "New York City, NY", age: 27, relationship: "Single", gender: "Female")
User.create!(username: "Adam Robinson", location: "Brooklyn, NY", age: 39, relationship: "Single" , gender: "Male")
User.create!(username: "Ashley Westcott", location: "New York City, NY", age: 29, relationship: "Single", gender: "Female")
User.create!(username: "Jessica Lin", location: "New York City, NY", age: 27, relationship: "Single", gender: "Female")
User.create!(username: "Dana Sevcik", location: "Brooklyn, NY", age: 31, relationship: "Single", gender: "Female")
User.create!(username: "Gabbie Piraino", location: "New York City, NY", age: 33, relationship: "In a relationship", gender: "Female")
User.create!(username: "Pamyk Charyyeva", location: "Brooklyn, NY", age: 24, relationship: "In a relationship", gender: "Female")
User.create!(username: "Yasmine Hartung", location: "New York City, NY", age: 31, relationship: "Married", gender: "Female")
User.create!(username: "Catherine Batsoula", location: "Brooklyn, NY", age: 23, relationship: "Married", gender: "Female")
User.create!(username: "Lisa Scott", location: "New York City, NY", age: 36, relationship: "Single", gender: "Female")
User.create!(username: "Augustus Kirby", location: "New York City, NY", age: 29, relationship: "In a relationship", gender: "Male")
User.create!(username: "Henry Koehler", location: "Brooklyn, NY", age: 33, relationship: "In a relationship", gender: "Male")
User.create!(username: "Oscar Rios", location: "Brooklyn, NY", age: 29, relationship: "Single", gender: "Male")
User.create!(username: "Qun Li", location: "New York City, NY", age: 25, relationship: "Single", gender: "Male")
User.create!(username: "Tashawn Williams", location: "New York City, NY", age: 35, relationship: "Single", gender: "Male")
User.create!(username: "Won Kim", location: "Bergen, NJ", age: 27, relationship: "In a relationship", gender: "Male")
User.create!(username: "Zach Vary", location: "Brooklyn, NY", age: 36, relationship: "Single", gender: "Male")
User.create!(username: "Adam Sultanov", location: "Brooklyn, NY", age: 29, relationship: "Single", gender: "Male")
User.create!(username: "Arslan Ali", location: "Camden, NJ", age: 25, relationship: "Single", gender: "Male")
User.create!(username: "Christian Duncan", location: "New York City, NY", age: 27, relationship: "In a relationship", gender: "Male")
User.create!(username: "Jason Gomez", location: "New Brunswick, NJ", age: 28, relationship: "Single", gender: "Male")



response = RestClient.get("https://api.songkick.com/api/3.0/metro_areas/7644/calendar.json?apikey=nu80rqJInvFVVDU4")
 response_data = JSON.parse(response)
 seed_events = response_data["resultsPage"]["results"]["event"]

 seed_events.each do |event|
 Venue.create!(name: event["venue"]["displayName"], address: event["location"]["city"])
 Ticket.create!(user_id: User.all.sample.id, venue_id: Venue.all.sample.id, artist_name: event["performance"][0]["displayName"], event_date: event["start"]["date"], available: true)

end
