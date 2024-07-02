class Event < ApplicationRecord

  def self.ransackable_associations(auth_object = nil)
    ["categories", "categorizations", "tickets", "user", "venue"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "end_time", "id", "id_value", "start_time", "title", "updated_at", "user_id", "venue_id"]
  end

  belongs_to :user
  belongs_to :venue

  # Association include
  has_many :tickets
  has_many :categorizations

  # This shows the association to the join table
  has_many :categories, through: :categorizations

  # Validation
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
