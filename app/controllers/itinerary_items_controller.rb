class ItineraryItemsController < ApplicationController
    def index
        if params[:leg_id]
            @itinerary_items = Leg.find_by(:id => params[:leg_id]).itinerary_items
        else
            flash[:notice] = "Not used."
        end
    end

    def new
        if params[:leg_id] && !Leg.exists?(params[:leg_id])
            redirect_to legs_path, alert: "Leg Not Found."
        else
            @itinerary_item = ItineraryItem.new(:leg_id => params[:leg_id])        
        end
    end

    def show
        if params[:leg_id] && !Leg.exists?(params[:leg_id])
            redirect_to legs_path, alert: "Leg Not Found."
        else
            @itinerary_item = ItineraryItem.find_by(:id => params[:id])
        end
    end

    def edit
        if params[:leg_id] && !Leg.exists?(params[:leg_id])
            redirect_to legs_path, alert: "Leg Not Found"
        else
            @itinerary_item = ItineraryItem.find_by(:id => params[:id])
        end
    end

    def create
        if params[:itinerary_item][:leg_id]
            @itinerary_item = ItineraryItem.new(itinerary_item_params)
            @leg = @itinerary_item.leg
            if @itinerary_item.save!
                redirect_to leg_itinerary_item_path(@leg, @itinerary_item)
            else
                redirect_to new_leg_itinerary_item_path(@leg), alert: "Could not Create Item"
            end
        end
    end

    private
    def itinerary_item_params
        params.require(:itinerary_item).permit(:leg_id, :time, :day_of_trip)
    end

end