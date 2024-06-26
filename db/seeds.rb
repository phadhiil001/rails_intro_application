# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Create Users
500.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    role: ['organizer', 'attendee'].sample)
end

# Create Venues
12.times do
  Venue.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    capacity: Faker::Number.between(from: 50, to: 500))
end

# Create Categories
categories = ['Conference', 'Workshop', 'Seminar', 'Meetup']
categories.each do |category|
  Category.create(name: category)
end

# Create Events
50.times do
  event = Event.create(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    start_time: Faker::Time.between_dates(from: DateTime.now - 1, to: DateTime.now, period: :day),
    end_time: Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 1, period: :day),
    user: User.where(role: 'organizer').sample,
    venue: Venue.all.sample
  )
  event.categories << Category.all.sample(rand(1..3))
end

# Create Tickets
Event.all.each do |event|
  rand(1..100).times do
    Ticket.create(
      event: event,
      user: User.where(role: 'attendee').sample,
      ticket_type: ['VIP', 'General', 'Early Bird'].sample,
      price: Faker::Commerce.price(range: 10.0..100.0)
    )
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?