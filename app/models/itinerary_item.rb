class ItineraryItem < ApplicationRecord
    belongs_to :leg

    def self.sort(leg_id)
        ItineraryItem.where(:leg_id => leg_id).order(:day_of_trip)
    end
end
