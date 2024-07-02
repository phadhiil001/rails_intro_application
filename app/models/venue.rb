class Venue < ApplicationRecord

    def self.ransackable_associations(auth_object = nil)
        ["events"]
      end

      def self.ransackable_attributes(auth_object = nil)
        ["address", "capacity", "created_at", "id", "id_value", "name", "updated_at"]
      end
    # Association include
    has_many :events

    # Validations
    validates :name, presence: true
    validates :address, presence: true
    validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
