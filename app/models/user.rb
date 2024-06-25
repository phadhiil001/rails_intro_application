class User < ApplicationRecord
    # Association include
    has_many :events
    has_many :tickets

    # Validation
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    scope :organizers, -> { where(role: 'organizer') }
    scope :attendees, -> { where(role: 'attendee') }
end
