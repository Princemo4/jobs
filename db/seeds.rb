# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Posting.where(title: "Web Developer").first_or_create(title: "Web Developer")

location = [
  "Denver, CO",
  "San Fransisco, CA",
  "New York, NY",
  "Chicago, IL",
  "Boston, MA",
  "Miami, FL",
  "Austin, TX",
  "Las Vegas, NV"
]

User.where(email: "tom@example.com").first_or_create(email: "tom@example.com", password: "password", name: "Tom Greene")

10.times do
  User.create(email: Faker::Internet.email,
              password: "password",
              name: Faker::Name.name)
end

100.times do
  Posting.create(title: Faker::Company.profession,
                  description: Faker::Lorem.paragraph(20),
                  salary: Faker::Commerce.price(6),
                  location: location.sample,
                  user_id: rand(1..10))
end



100.times do
  Submital.create(user_id: rand(1..10),
                  posting_id: rand(1..100))
end
