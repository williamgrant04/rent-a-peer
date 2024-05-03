require "open-uri"
require "faker"

puts "Deleting cleaning out the database..."
Booking.destroy_all
Review.destroy_all
Listing.destroy_all
UserService.destroy_all
Service.destroy_all
User.destroy_all
puts "Done."

# User seeds (development only, remove before final prod push)
puts "Seeding users..."
user = User.new(email: "name@some.email", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..50), location: Faker::Locations::Australia.location, password: "password", password_confirmation: "password")
user.profile_image.attach(io: URI.open("https://images.unsplash.com/photo-1708962188322-0e9a5e40c101?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "shower.png", content_type: "image/png")
user.save!

user2 = User.new(email: "another@some.email", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..50), location: Faker::Locations::Australia.location, password: "password", password_confirmation: "password")
user2.profile_image.attach(io: URI.open("https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "ellis.jpg", content_type: "image/jpg")
user2.save!

user3 = User.new(email: "some@other.email", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..50), location: Faker::Locations::Australia.location, password: "password", password_confirmation: "password")
user3.profile_image.attach(io: URI.open("https://images.unsplash.com/photo-1552058544-f2b08422138a?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "ellis.jpg", content_type: "image/jpg")
user3.save!

user4 = User.new(email: "ihate@making.emails", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..50), location: Faker::Locations::Australia.location, password: "password", password_confirmation: "password")
user4.profile_image.attach(io: URI.open("https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "ellis.jpg", content_type: "image/jpg")
user4.save!
puts "Done."

# Service seeds


puts 'Seeding Services'
Service.create!(name: 'Cleaning', icon: "fa-solid fa-soap")
Service.create!(name: 'Cooking', icon: "fa-solid fa-utensils")
Service.create!(name: 'Gardening', icon: "fa-solid fa-house")
Service.create!(name: 'Painting', icon: "fa-solid fa-paintbrush")
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
  6.times do
    service = Service.all.sample
    unless UserService.find_by(user: user, service: service)
      UserService.create!(user: user, service: service)
    end
  end
end
puts "Done."

puts "Seeding listings..."
User.all.each do |user|
  UserService.where(user: user).each do |user_service|
    listing = Listing.new(
      title: Faker::Company.name,
      description: "Providing top-quality #{user_service.service.name} services tailored to your needs, ensuring your space shines and sparkles with every visit. Get in touch today, and let's make your space happier place to be!",
      hourly_rate: rand(10..30),
      user_service: user_service,
    )
    listing.listing_image.attach(io: URI.open("https://loremflickr.com/200/200/#{user_service.service.name.downcase.gsub(" ", "_")}"), filename: "#{user_service.service.name.downcase}.jpg", content_type: "image/jpg")
    listing.save
  end
end
puts "Done."

puts "Seeding bookings..."
Listing.all.each do |listing|
  3.times do
    Booking.create!(
      user: User.where.not(id: listing.user_service.user.id).sample,
      listing: listing,
      start_date: Date.today,
      end_date: Date.today + 1.week
    )
  end
end
puts "Done."

  puts "Seeding reviews..."
  User.all.each do |user|
    UserService.where.not(user: user).each do |serv|
      Review.create!(
        title: "My review",
        content: "The #{serv.user.first_name} did a great job at #{serv.service.name}",
        rating: rand(0..5),
        user: user,
        user_service: serv
      )
    end
  end
  puts "Done."
