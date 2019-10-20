class Leg < ApplicationRecord
    belongs_to :vacation
    has_many :itinerary_items
    validates :departure_place_id, presence: true
    validates :arrival_place_id, presence: true
    validate :arrival_departure_cannot_be_same

    def self.sort(vacation_id)
        Leg.where(:vacation_id => vacation_id).order(:leg_num)
    end

    def arrival_departure_cannot_be_same
        if arrival_place_id == departure_place_id
            errors.add(:departure_place_id, "cannot be the same as arrival location")
        end
    end
end
