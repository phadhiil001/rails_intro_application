class Category < ApplicationRecord

    def self.ransackable_associations(auth_object = nil)
        ["categorizations", "events"]
      end

      def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "name", "updated_at"]
      end
    # Association include
    has_many :categorizations
    has_many :events, through: :categorizations


    # Validations
    validates :name, presence: true, uniqueness: true
end
