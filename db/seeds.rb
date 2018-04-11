# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.motability.co.uk/cars-scooters-and-powerchairs/types-of-cars/by-makes-and-models"))

make = doc.search("tbody td")
makes = make.children.collect.with_index(1){|make,i| make.text if i.odd?}.compact
models = make.children.collect.with_index(1){|model,i| model.text if i.even?}.compact

10.times do
  Destination.create(
    name: Faker::HitchhikersGuideToTheGalaxy.location,
    description: Faker::Hipster.paragraph,
    city: Faker::Address.city,
    state: Faker::Address.state,
    street_address: Faker::Address.street_address
  )
  RoadTrip.create(
    author_id: rand(1..10),
    title: Faker::Book.title,
    description: Faker::Hipster.paragraph
  )
  Tag.create(
    title: Faker::Hipster.word
  )
  Car.create(
    make: makes.sample,
    model: models.sample,
    mpg: rand(20..60)
  )
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
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
