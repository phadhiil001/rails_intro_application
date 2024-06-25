class User < ApplicationRecord
    # Association include
    has_many :events
    has_many :tickets
end
