# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
makes = ["BMW","Audi","Toyota","Chevy","Ford","Dodge","Lincoln","Buick","Honda","Nissan"]
models_by_make = {
  "BMW" => ["328i","M3","M5","X1","X3","X5"],
  "Audi" => ["A4","A5","S5","A7","A8"],
  "Toyota" => ["Prius","Camry","Corolla"],
  "Chevy" => ["Camero","Silverado","Malibu"],
  "Ford" => ["Mustang","F150","Focus","Fiesta"],
  "Dodge" => ["Ram","Challenger","Charger","Durango"],
  "Lincoln" => ["Navigator","MKZ","MKX","MKS"],
  "Buick" => ["Enclave","Regal","LaCrosse","Verano","Encore","Riveria"],
  "Honda" => ["Accord","Civic","CR-V","Odyssey"],
  "Nissan" => ["Rogue","Juke","Cube","Pathfiner","Versa","Altima"]
}

10.times do
  Destination.create(
    name: Faker::HitchhikersGuideToTheGalaxy.location,
    description: Faker::Hipster.paragraph,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    street_address: Faker::Address.street_address
  )
  RoadTrip.create(
    author_id: rand(1..10),
    title: Faker::Book.title,
    description: Faker::Hipster.paragraph,
    total_miles: rand(200..2000)
  )
  Tag.create(
    title: Faker::Hipster.word
  )
  make = makes.sample
  model = models_by_make[make].sample
  Car.create(
    make: make,
    model: model,
    mpg: rand(20..60)
  )
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password",
    miles_driven: rand(100..200000),
    current_car_id: rand(1..10),
    current_trip_id: rand(1..10)
  )
end

20.times do
  UserCar.create(
    user_id: rand(1..10),
    car_id: rand(1..10)
  )
  UserRoadTrip.create(
    user_id: rand(1..10),
    road_trip_id: rand(1..10),
  )
  DestinationTag.create(
    destination_id: rand(1..10),
    tag_id: rand(1..10)
  )
  DestinationRoadTrip.create(
    destination_id: rand(1..10),
    road_trip_id: rand(1..10),
    destination_order: rand(1..10)
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
