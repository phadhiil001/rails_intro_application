class User < ApplicationRecord
    # Association include
    has_many :events
    has_many :tickets

    # Validation
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
