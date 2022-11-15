# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Meal.destroy_all

user = User.last

10.times do
  Meal.create!(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: rand(0.1..20).round(2),
    user: user
  )
end

puts "10 meals created"
