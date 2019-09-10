class Leg < ApplicationRecord
    belongs_to :vacation
    has_many :itinerary_items

    def self.insert_places(params)
        vacation = Vacation.find_by(:id => params[:leg][:vacation_id])
        arrival_place = Place.find_by(:id => params[:leg][:arrival_place_id])
        departure_place = Place.find_by(:id => params[:leg][:departure_place_id])
        if vacation.places.include?(arrival_place)
            vacation.places << arrival_place
        end
        if vacation.places.include?(departure_place)
            vacation.places << departure_place
        end

    end
end
