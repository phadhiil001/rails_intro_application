class User < ApplicationRecord

    def self.ransackable_associations(auth_object = nil)
        ["events", "tickets"]
      end

      def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email", "id", "id_value", "name", "role", "updated_at"]
      end

    # Association include
    has_many :events
    has_many :tickets

    # Validation
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    scope :organizers, -> { where(role: 'organizer') }
    scope :attendees, -> { where(role: 'attendee') }
end
