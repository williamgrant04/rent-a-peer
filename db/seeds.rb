require "open-uri"

puts "Deleting all users..."
User.destroy_all
puts "Done."

# User seeds (development only, remove before final prod push)
puts "Seeding users..."
user = User.new(email: "name@some.email", first_name: "Name", last_name: "McName", age: 25, location: "Location", password: "password", password_confirmation: "password")
user.profile_image.attach(io: URI.open("https://images.unsplash.com/photo-1708962188322-0e9a5e40c101?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "shower.png", content_type: "image/png")
user.save!
# User.create!(email: "brad@test.email", first_name: "Brad", last_name: "Dougherty", age: 25, location: "Location", password: "password", password_confirmation: "password")
# User.create!(email: "will@test.email", first_name: "William", last_name: "Grant", age: 25, location: "Location", password: "password", password_confirmation: "password")
# User.create!(email: "rucha@email.test", first_name: "Rucha", last_name: "Gade", age: 25, location: "Location", password: "password", password_confirmation: "password")
# User.create!(email: "edgard@test.test", first_name: "Edgard", last_name: "Revol", age: 25, location: "Location", password: "password", password_confirmation: "password")
puts "Done."

# Service seeds
puts "Deleting all services..."
Service.destroy_all
puts 'Done.'

puts 'Seeding Services'
service1 = Service.create!(name: 'Cleaning')
service2 = Service.create!(name: 'Cooking')
service3 = Service.create!(name: 'Gardening')
service4 = Service.create!(name: 'Painting')
Service.create!(name: 'Plumbing')
Service.create!(name: 'Tutoring')
puts "Done."

puts "Deleting all user_services..."
UserService.destroy_all
puts "Done."

puts "Seeding user_services..."
user_service1 = UserService.create!(user: user, service: service1)
user_service2 = UserService.create!(user: user, service: service2)
user_service3 = UserService.create!(user: user, service: service3)
user_service4 = UserService.create!(user: user, service: service4)
puts "Done."

puts "Deleting all listings..."
Listing.destroy_all
puts "Done."

puts "Seeding listings..."
Listing.create!(
  title: "Listing",
  description: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nulla id totam cupiditate nihil pariatur maxime dolore aliquid doloribus fugit temporibus, quia et quam sapiente harum, odit ex. Omnis, doloremque! Dolores.",
  hourly_rate: 25.0,
  user_service: user_service1
)
Listing.create!(
  title: "Listing",
  description: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nulla id totam cupiditate nihil pariatur maxime dolore aliquid doloribus fugit temporibus, quia et quam sapiente harum, odit ex. Omnis, doloremque! Dolores.",
  hourly_rate: 137.0,
  user_service: user_service2
)
Listing.create!(
  title: "Listing",
  description: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nulla id totam cupiditate nihil pariatur maxime dolore aliquid doloribus fugit temporibus, quia et quam sapiente harum, odit ex. Omnis, doloremque! Dolores.",
  hourly_rate: 19.0,
  user_service: user_service3
)
Listing.create!(
  title: "Listing",
  description: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nulla id totam cupiditate nihil pariatur maxime dolore aliquid doloribus fugit temporibus, quia et quam sapiente harum, odit ex. Omnis, doloremque! Dolores.",
  hourly_rate: 3.4,
  user_service: user_service4
)
