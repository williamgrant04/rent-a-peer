require "open-uri"

puts "Deleting cleaning out the database..."
Listing.destroy_all
UserService.destroy_all
Service.destroy_all
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


puts 'Seeding Services'
Service.create!(name: 'Cleaning', icon: "fa-solid fa-soap") #service1
Service.create!(name: 'Cooking', icon: "fa-solid fa-utensils") #service2
Service.create!(name: 'Gardening', icon: "fa-solid fa-house") #service3
Service.create!(name: 'Painting', icon: "fa-solid fa-paintbrush") #service4
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



puts "Seeding user_services..."

User.all.each do |user|
  services = Service.first(5)
  2.times do
    service = services.sample
    UserService.create!(user: user, service: service)
    services.delete(service)
  end
end
puts "Done."

puts "Seeding listings..."
User.all.each do |user|
  user.user_services.each do |user_service|
    Listing.create!(
      title: user_service.service.name,
      description: "Providing top-quality #{user_service.service.name} services tailored to your needs, ensuring your space shines and sparkles with every visit.Get in touch today, and let's make your space happier place to be! ",
      hourly_rate: 25.0,
      user_service: user_service
    )
  end
end
