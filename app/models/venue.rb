class Venue < ApplicationRecord
    # Association include
    has_many :events
end
