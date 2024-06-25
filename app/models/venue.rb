class Venue < ApplicationRecord
    # Association include
    has_many :events

    # Validations
    validates :name, presence: true
    validates :address, presence: true
    validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
