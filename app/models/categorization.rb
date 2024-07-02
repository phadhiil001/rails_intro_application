class Categorization < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "event_id", "id", "id_value", "updated_at"]
  end

  belongs_to :event
  belongs_to :category
end
