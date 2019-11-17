class Leg < ApplicationRecord
    belongs_to :vacation
    belongs_to :destination
    has_many :itinerary_items
    validates :departure_id, presence: true
    validates :destination_id, presence: true
    validates :leg_num, uniqueness: { scope: :vacation, message: "has been set already"}
    validate :departure_destination_cannot_be_same

    def self.sort(vacation_id)
        Leg.where(:vacation_id => vacation_id).order(:leg_num)
    end

    def departure_destination_cannot_be_same
        if departure_id == destination_id
            errors.add(:destination_id, "cannot be the same as departure location")
        end
    end

end
