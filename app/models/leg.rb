class Leg < ApplicationRecord
    belongs_to :vacation
    has_many :itinerary_items

    def self.update_vacation_places(leg, action)
        arrival_place = Place.find_by(:id => leg.arrival_place_id)
        departure_place = Place.find_by(:id => leg.departure_place_id)
        if action == "create"
            if arrival_place.present?
                if !leg.vacation.places.include?(arrival_place)
                    leg.vacation.places << arrival_place
                end
            end
            if departure_place.present?
                if !leg.vacation.places.include?(departure_place)
                    leg.vacation.places << departure_place
                end
            end
        else action == "delete"
            leg.vacation.places.delete(arrival_place)
            leg.vacation.places.delete(departure_place)
        end
    end

end
