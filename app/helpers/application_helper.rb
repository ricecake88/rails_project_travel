module ApplicationHelper

    def self.place(place_id)
        Place.find_by(:id => place_id)
    end

    def self.attraction(object)
        Attraction.find_by(:id => object.attraction_id)
    end
end
