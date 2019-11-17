class ItineraryItem < ApplicationRecord
    belongs_to :leg
    validates :attraction_id, presence: true, if: :event_type?
    validates :day_of_trip, presence: true
    validate :no_attraction_when_activity_not_attraction

    def event_type?
        type_of_activity == "Event"
    end

    def self.sort(leg_id)
        ItineraryItem.where(:leg_id => leg_id).order(:day_of_trip, :time)
    end

    def no_attraction_when_activity_not_attraction
        if attraction_id.present? && type_of_activity != "Event"
            errors.add(:attraction_id, "can't have an attraction when type of activity is not an attraction")
        end
    end
end
