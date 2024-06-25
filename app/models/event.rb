class Event < ApplicationRecord
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
