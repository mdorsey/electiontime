# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserType.create!(name: "Admin")
UserType.create!(name: "Ambassador")
UserType.create!(name: "Candidate")

User.create!(first_name:  "Michael",
             last_name: "Dorsey",
             email: "michael.william.dorsey@gmail.com",
             user_type_id: UserType.find_by(name: 'Admin').id,
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name: first_name,
               last_name: last_name,             
               email: email,
               user_type_id: UserType.find_by(name: 'Candidate').id,
               password:              password,
               password_confirmation: password)
end