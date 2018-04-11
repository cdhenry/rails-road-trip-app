# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  Destinations.create(
    name: Faker::HitchhikersGuideToTheGalaxy.location
    description: Faker::Hipster.paragraph
    city: Faker::Address.city
    state: Faker::Address.state
    street_address: Faker::Address.street_address
  )
  RoadTrips.create(
    author_id: rand[1..10]
    title: Faker::Book.title
    description: Faker::Hipster.paragraph
  )
  Tags.create(
    title: Faker::Hipster.word
  )
  car_make = Faker::Vehicle.make
  Cars.create(
    make: car_make
    model: Faker::Vehicle.models_by_make.car_make
    mpg: rand[20..60]
  )
  Users.create(
    username: Faker::Internet.user_name
    email: Faker::Internet.email
    password: Faker::Internet.password(6)
  )
end


#
# counter = 1
# Item.all.each do |item|
#   item.category_id = counter
#   item.save
#   counter += 1
# end
# FactoryBot.create(:user)
