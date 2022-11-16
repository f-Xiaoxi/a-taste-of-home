# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Meal.destroy_all

user = User.last

10.times do
  file = URI.open("https://minimalistbaker.com/wp-content/uploads/2022/09/STUNNING-Potato-Gratin-with-Vegan-Cream-Sauce-8-ingredients-tender-potatoes-perfect-for-the-holidays-minimalistbaker-recipe-plantbased-potato-gratin-8-1024x1536.jpg")
  meal = Meal.new(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: rand(0.1..20).round(2),
    seller: user
  )
  meal.photo.attach(io: file, filename: "mealpic.png", content_type: "image/png")
  meal.save
end


puts "10 meals created"
