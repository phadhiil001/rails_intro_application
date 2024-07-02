class Ticket < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "event_id", "id", "id_value", "price", "ticket_type", "updated_at", "user_id"]
  end

  belongs_to :event
  belongs_to :user

  # Validation
  validates :ticket_type, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
