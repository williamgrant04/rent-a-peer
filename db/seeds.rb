require "open-uri"

puts "Deleting all users..."
User.destroy_all
puts "Done."

# User seeds (development only, remove before final prod push)
puts "Seeding users..."
u = User.new(email: "name@some.email", first_name: "Name", last_name: "McName", age: 25, location: "Location", password: "password", password_confirmation: "password")
u.profile_image.attach(io: URI.open("https://images.unsplash.com/photo-1708962188322-0e9a5e40c101?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "shower.png", content_type: "image/png")
u.save!
# User.create!(email: "brad@test.email", first_name: "Brad", last_name: "Dougherty", age: 25, location: "Location", password: "password", password_confirmation: "password")
# User.create!(email: "will@test.email", first_name: "William", last_name: "Grant", age: 25, location: "Location", password: "password", password_confirmation: "password")
# User.create!(email: "rucha@email.test", first_name: "Rucha", last_name: "Gade", age: 25, location: "Location", password: "password", password_confirmation: "password")
# User.create!(email: "edgard@test.test", first_name: "Edgard", last_name: "Revol", age: 25, location: "Location", password: "password", password_confirmation: "password")
puts "Done."

# Service seeds
puts "Deleting all services..."
Service.destroy_all
puts 'Done'

puts 'Seeding Services'
Service.create!(name: 'Cleaning')
Service.create!(name: 'Cooking')
Service.create!(name: 'Gardening')
Service.create!(name: 'Painting')
Service.create!(name: 'Plumbing')
Service.create!(name: 'Tutoring')
puts "Done."
