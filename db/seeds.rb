require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Boat.destroy_all
Booking.destroy_all
User.destroy_all
Review.destroy_all
CrewMember.destroy_all

puts 'Creating users...'
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    password: '123456'
  )
  file = URI.open('https://source.unsplash.com/300x300/?portrait')
  user.photo.attach(io: file, filename: user.first_name.to_s, content_type: 'image/png')
  user.save!
end

puts 'Creating boats...'
User.all.each do |user|
  rand(0..3).times do
    boat = Boat.new(
      name: Faker::TvShows::RuPaul.queen,
      description: Faker::Lorem.paragraph_by_chars(number: 200),
      price: rand(249..10_459),
      guests: rand(1..15),
      location: Faker::Address.city,
      user: user,
      category: Boat::CATEGORIES.sample
    )
    file = URI.open('https://source.unsplash.com/1600x900/?boat')
    boat.photos.attach(io: file, filename: boat.name.to_s, content_type: 'image/png')
    boat.save!
  end
end

puts 'Creating bookings...'
Boat.all.each do |boat|
  rand(1..3).times do
    Booking.create!(
      arrival: Faker::Date.between(from: 200.days.ago, to: Date.today),
      departure: Faker::Date.between(from: Date.today, to: 200.days.from_now),
      boat: boat,
      user: User.all.sample,
      comment: Faker::Lorem.paragraph_by_chars(number: 300)
    )
  end
end

puts 'Creating reviews...'
Booking.all.each do |booking|
  rand(3..10).times do
    Review.create!(
      rating: rand(3..5),
      comment: Faker::Restaurant.review[0..80],
      booking: booking
    )
  end
end

puts 'Creating crew members...'
Boat.all.each do |boat|
  rand(2..6).times do
    member = CrewMember.new(
      name: Faker::Name.name,
      description: Faker::Marketing.buzzwords,
      boat: boat
    )
    file = URI.open('https://source.unsplash.com/300x300/?portrait')
    member.photo.attach(io: file, filename: member.name.to_s, content_type: 'image/png')
    member.save!
  end
end

puts 'Finished!'
