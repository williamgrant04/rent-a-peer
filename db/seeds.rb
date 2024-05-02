require "open-uri"

puts "Deleting all users..."
User.destroy_all
puts "Done."

# User seeds (development only, remove before final prod push)
puts "Seeding users..."
user = User.new(email: "name@some.email", first_name: "Name", last_name: "McName", age: 25, location: "Location", password: "password", password_confirmation: "password")
user.profile_image.attach(io: URI.open("https://images.unsplash.com/photo-1708962188322-0e9a5e40c101?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "shower.png", content_type: "image/png")
user.save!

user2 = User.new(email: "another@some.email", first_name: "John", last_name: "Doe", age: 31, location: "England", password: "password", password_confirmation: "password")
user2.profile_image.attach(io: URI.open("https://nationaltoday.com/wp-content/uploads/2022/11/456841291-min-1200x834.jpg"), filename: "ellis.jpg", content_type: "image/jpg")
user2.save!
puts "Done."

# Service seeds
puts "Deleting all services..."
Service.destroy_all
puts 'Done.'

puts 'Seeding Services'
service1 = Service.create!(name: 'Cleaning', icon: "fa-solid fa-soap")
service2 = Service.create!(name: 'Cooking', icon: "fa-solid fa-utensils")
service3 = Service.create!(name: 'Gardening', icon: "fa-solid fa-house")
service4 = Service.create!(name: 'Painting', icon: "fa-solid fa-paintbrush")
Service.create!(name: 'Plumbing', icon: "fa-solid fa-wrench")
Service.create!(name: 'Tutoring', icon: "fa-solid fa-graduation-cap")
Service.create!(name: 'Development', icon: "fa-solid fa-code")
Service.create!(name: 'Building', icon: "fa-solid fa-hammer")
Service.create!(name: 'Filming', icon: "fa-solid fa-clapperboard")
Service.create!(name: 'Writing', icon: "fa-solid fa-pen")
Service.create!(name: 'Murdering', icon: "fa-solid fa-skull")
Service.create!(name: 'Floristry', icon: "fa-solid fa-fan")
Service.create!(name: 'Sewing', icon: "fa-solid fa-map-pin")
Service.create!(name: 'Hair dressing', icon: "fa-solid fa-scissors")
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
