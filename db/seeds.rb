# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Clearing old data..."
Order.destroy_all
Meal.destroy_all
User.destroy_all
Category.destroy_all
Tag.destroy_all

puts "Creating users..."
fai = User.create!(
  email: 'email@email.com',
  password: '123123',
  first_name: 'Fai',
  last_name: 'Rude'
)

zh = User.create!(
  email: 'email1@email.com',
  password: '123123',
  first_name: 'Zong',
  last_name: 'Ha'
)
rich = User.create!(
  email: 'rich@email.com',
  password: '123123',
  first_name: 'Rich',
  last_name: 'Ard'
)

puts "Creating ZH's meals..."
3.times do
  file = URI.open("https://minimalistbaker.com/wp-content/uploads/2022/09/STUNNING-Potato-Gratin-with-Vegan-Cream-Sauce-8-ingredients-tender-potatoes-perfect-for-the-holidays-minimalistbaker-recipe-plantbased-potato-gratin-8-1024x1536.jpg")
  meal = Meal.new(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: rand(0.1..20).round(2),
    user: zh
  )
  meal.photo.attach(io: file, filename: "mealpic.png", content_type: "image/png")
  meal.save
end

puts "Creating Fai's meals..."
3.times do
  file = URI.open("https://minimalistbaker.com/wp-content/uploads/2022/09/FLUFFY-Maple-Pumpkin-Butter-Vegan-naturally-sweetened-4-ingredients-perfect-for-fall-minimalistbaker-recipe-plantbased-maple-pumpkin-butter-5-1024x1536.jpg")
  meal = Meal.new(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: rand(0.1..20).round(2),
    user: fai
  )
  meal.photo.attach(io: file, filename: "mealpic.png", content_type: "image/png")
  meal.save
end

puts "Creating Rich's meals..."
3.times do
  file = URI.open("https://minimalistbaker.com/wp-content/uploads/2022/09/Roasted-Cauliflower-Salad-with-Middle-Eastern-inspired-spices-Beautiful-fresh-and-just-30-minutes-minimalistbaker-recipe-plantbased-cauliflower-side-7-1024x1536.jpg")
  meal = Meal.new(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: rand(0.1..20).round(2),
    user: rich
  )
  meal.photo.attach(io: file, filename: "mealpic.png", content_type: "image/png")
  meal.save
end

puts "Creating categories..."
Category.create!(name: 'Vegan')
Category.create!(name: 'Vegetarian')
Category.create!(name: 'Halal')
Category.create!(name: 'Gluten-Free')
Category.create!(name: 'Refined Sugar-Free')

puts "Creating tags..."
Tag.create!(meal: Meal.first, category: Category.first)
Tag.create!(meal: Meal.first, category: Category.last)
Tag.create!(meal: Meal.last, category: Category.first)

puts "Creating orders..."
Order.create!(
  meal: Meal.first,
  buyer: fai,
  status: 'pending'
)

Order.create!(
  meal: Meal.last,
  buyer: fai,
  status: 'pending'
)

Order.create!(
  meal: Meal.last,
  buyer: zh,
  status: 'pending'
)

puts "Done!"
