class ItineraryItem < ApplicationRecord
    belongs_to :leg
    validates :attraction_id, presence: true, if: :event_type?
    validates :day_of_trip, presence: true

    def event_type?
        type_of_activity == "Event"
    end

    def self.sort(leg_id)
        ItineraryItem.where(:leg_id => leg_id).order(:day_of_trip)
    end
end
