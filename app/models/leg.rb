class Leg < ApplicationRecord
    belongs_to :vacation
    has_many :itinerary_items

    def self.insert_and_update_places(leg)
        vacation = Vacation.find_by(:id => leg.vacation_id)
        arrival_place = Place.find_by(:id => leg.arrival_place_id)
        departure_place = Place.find_by(:id => leg.departure_place_id)
        if arrival_place.present? && vacation.places.include?(arrival_place)
            vacation.places << arrival_place
            leg.update(:arrival_city_name => arrival_place.city_name)
        end
        if departure_place.present? && vacation.places.include?(departure_place)
            vacation.places << departure_place
            leg.update(:departure_city_name => departure_place.city_name)
        end
    end
end
