require 'faker'

puts 'Cleaning database...'
Boat.destroy_all
Booking.destroy_all
User.destroy_all
Review.destroy_all
CrewMember.destroy_all

puts 'Creating users...'
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    password: '123456'
  )
end

puts 'Creating boats...'
20.times do
  Boat.create!(
    name: Faker::TvShows::RuPaul.queen,
    description: Faker::Lorem.paragraph,
    price: rand(249..10_459),
    guests: rand(1..15),
    location: Faker::Address.city,
    user: User.all.sample
  )
end

puts 'Creating bookings...'
50.times do
  Booking.create!(
    arrival: Faker::Date.between(from: 200.days.ago, to: Date.today),
    departure: Faker::Date.between(from: Date.today, to: 200.days.from_now),
    boat: Boat.all.sample,
    user: User.all.sample
  )
end

puts 'Creating reviews...'
100.times do
  Review.create!(
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph,
    booking: Booking.all.sample
  )
end

puts 'Creating crew members...'
100.times do
  CrewMember.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    boat: Boat.all.sample
  )
end

puts 'Finished!'
