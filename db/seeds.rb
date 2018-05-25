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

images = (1..14).to_a.map do |n|
  'images/seed-omas/g#{n}.jpg'
end

addresses = [" Alexanderpl. 1, 10178 Berlin ", "Revaler Str. 1, 10243 Berlin", "Rigaer Str. 94, 10247 Berlin", "Mariannen Str. 27, 10999 Berlin", "Jonas Str. 41, 14053", "Pfalzburger Str. 29, 10717 Berlin", "Sonnenallee 137, 12059 Berlin", "Storkower Str. 121, 10407 Berlin", "Am Wriezener Bahnhof, 10243 Berlin", "Schicklerstraße 4, 10179 Berlin", "Mariannen Str. 6, 10997 Berlin", "An der Apostelkirche 12, 10783 Berlin"]


4.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Job.title,
    photo: images.sample,
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
