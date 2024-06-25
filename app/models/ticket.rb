class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # Validation
  validates :ticket_type, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
