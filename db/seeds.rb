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
User.all.each do |user|
  rand(0..10).times do
    Boat.create!(
      name: Faker::TvShows::RuPaul.queen,
      description: Faker::Lorem.paragraph(sentence_count: 10),
      price: rand(249..10_459),
      guests: rand(1..15),
      location: Faker::Address.city,
      user: user,
      category: Boat::CATEGORIES.sample
    )
  end
end

puts 'Creating bookings...'
Boat.all.each do |boat|
  rand(2..10).times do
    Booking.create!(
      arrival: Faker::Date.between(from: 200.days.ago, to: Date.today),
      departure: Faker::Date.between(from: Date.today, to: 200.days.from_now),
      boat: boat,
      user: User.all.sample,
      comment: Faker::Lorem.paragraph(sentence_count: 6)
    )
  end
end

puts 'Creating reviews...'
Booking.all.each do |booking|
  rand(3..20).times do
    Review.create!(
      rating: rand(3..5),
      comment: Faker::Lorem.paragraph,
      booking: booking
    )
  end
end

puts 'Creating crew members...'
Boat.all.each do |boat|
  rand(1..12).times do
    CrewMember.create!(
      name: Faker::Name.name,
      description: Faker::Lorem.paragraph,
      boat: boat
    )
  end
end

puts 'Finished!'
