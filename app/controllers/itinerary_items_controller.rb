class ItineraryItemsController < ApplicationController
    def index
        if params[:leg_id]
            @legs = current_user.legs
        else
            #change this into a function - actually, this would fail
            @itinerary_items = ItineraryItems.all
        end
    end

    def show
        @itinerary_item = ItineraryItems.find(param[:itinerary_item])
    end
end