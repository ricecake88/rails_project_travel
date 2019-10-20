module ApplicationHelper

    def self.place(place_id)
        Place.find_by(:id => place_id)
    end

    def self.attraction(object)
        Attraction.find_by(:id => object.attraction_id)
    end

    def flash_error_message(arg)
        "The form contains #{ActionController::Base.helpers.pluralize(arg.errors.count, 'error')}:<br> #{arg.errors.full_messages.join('<br> ')}"
    end
end
