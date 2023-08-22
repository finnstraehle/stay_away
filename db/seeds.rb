require 'faker'

20.times do
  Boat.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    price: rand(249..10459),
    guests: rand(1..15),
    location: Faker::Address.city,
  )
end
