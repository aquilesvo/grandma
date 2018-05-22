# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Grandmom.destroy_all

20.times do
  Grandmom.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::HowIMetYourMother.quote,
    price: rand(20..60),
    cooking: [true, false].sample,
    childcare: [true, false].sample,
    storytelling: [true, false].sample,
    goforawalk: [true, false].sample,
    address: Faker::Address.street_name,
  })
end


