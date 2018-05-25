# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Grandmom.destroy_all

images = [
  "http://res.cloudinary.com/twentythree/image/upload/v1527256890/g1.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527255970/g2.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527255945/g3.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527253290/g4.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527253274/g5.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527253256/g6.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527253197/g7.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527251543/g8.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527249487/g9.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527249451/g10.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527249413/g11.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527247797/g12.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527178421/g13.jpg",
  "http://res.cloudinary.com/twentythree/image/upload/v1527166506/g14.jpg"
]

addresses = [" Alexanderpl. 1, 10178 Berlin ", "Revaler Str. 1, 10243 Berlin", "Rigaer Str. 94, 10247 Berlin", "Mariannen Str. 27, 10999 Berlin", "Jonas Str. 41, 14053", "Pfalzburger Str. 29, 10717 Berlin", "Sonnenallee 137, 12059 Berlin", "Storkower Str. 121, 10407 Berlin", "Am Wriezener Bahnhof, 10243 Berlin", "Schicklerstraße 4, 10179 Berlin", "Mariannen Str. 6, 10997 Berlin", "An der Apostelkirche 12, 10783 Berlin"]


4.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Job.title,
    photo: "http://res.cloudinary.com/twentythree/image/upload/v1527256813/profile_placeholder.jpg"
  })
  user.save!
end


12.times do
  g = Grandmom.new({
    first_name: "Oma",
    last_name: Faker::NewGirl.character,
    description: Faker::Movie.quote,
    price: rand(20..60),
    cooking: [true, false].sample,
    childcare: [true, false].sample,
    storytelling: [true, false].sample,
    goforawalk: [true, false].sample,
    user_id: rand(1..4),
    address: addresses.sample,
    photo: images.sample
  })
  g.save!
end
