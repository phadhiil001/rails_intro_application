class Category < ApplicationRecord
    # Association include
    has_many :categorizations
    has_many :events, through: :categorizations

    # Validations
    validates :name, presence: true
end
