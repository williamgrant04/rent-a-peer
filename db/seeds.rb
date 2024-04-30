# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Deleting all users..."

User.destroy_all

puts "Done."

puts "Seeding users..."
User.create!(email: "name@some.email", first_name: "Name", last_name: "McName", age: 25, location: "Location", password: "password", password_confirmation: "password")
User.create!(email: "brad@test.email", first_name: "Brad", last_name: "Dougherty", age: 25, location: "Location", password: "password", password_confirmation: "password")
User.create!(email: "will@test.email", first_name: "William", last_name: "Grant", age: 25, location: "Location", password: "password", password_confirmation: "password")
User.create!(email: "rucha@email.test", first_name: "Rucha", last_name: "Gade", age: 25, location: "Location", password: "password", password_confirmation: "password")
User.create!(email: "edgard@test.test", first_name: "Edgard", last_name: "Revol", age: 25, location: "Location", password: "password", password_confirmation: "password")
puts "Done."
