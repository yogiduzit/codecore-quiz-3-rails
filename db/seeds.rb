# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
User.destroy_all

NUM_POSTS = 50
NUM_USERS = 7

counter = 0

User.create(
  first_name: "Yogesh",
  last_name: "Verma",
  email: "itsyog35h@gmail.com",
  password: "yogi"
)

NUM_USERS.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}-#{last_name}-#{counter}@gmail.com",
    password: "supersecret"
  )
  counter += 1
end

NUM_POSTS.times do 
  Post.create(
    title: Faker::Educator.subject,
    body: Faker::ChuckNorris.fact,
    user: User.all.sample
  )
end
