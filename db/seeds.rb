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

# Clear existing data
User.destroy_all
Event.destroy_all
Venue.destroy_all
Category.destroy_all
Ticket.destroy_all

# Create Users
10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, role: ['organizer', 'attendee'].sample)
end

# Create Venues
5.times do
  Venue.create(name: Faker::Company.name, address: Faker::Address.full_address, capacity: Faker::Number.between(from: 50, to: 500))
end

# Create Categories
categories = ['Conference', 'Workshop', 'Seminar', 'Meetup']
categories.each do |category|
  Category.create(name: category)
end

# Create Events
20.times do
  event = Event.create(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    start_time: Faker::Time.forward(days: 30),
    end_time: Faker::Time.forward(days: 30, period: :evening),
    user: User.organizers.sample,
    venue: Venue.all.sample
  )
  event.categories << Category.all.sample(rand(1..3))
end

# Create Tickets
Event.all.each do |event|
  rand(1..10).times do
    Ticket.create(
      event: event,
      user: User.attendees.sample,
      ticket_type: ['VIP', 'General', 'Early Bird'].sample,
      price: Faker::Commerce.price(range: 10.0..100.0)
    )
  end
end
