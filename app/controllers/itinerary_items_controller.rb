class ItineraryItemsController < ApplicationController
    def index
        if params[:leg_id]
            @itinerary_items = ItineraryItem.sort(params[:leg_id])
        else
            flash[:notice] = "Not used."
        end
    end

    def new
        if params[:leg_id] && !Leg.exists?(params[:leg_id])
            redirect_to legs_path, alert: "Leg Not Found."
        else
            @itinerary_item = ItineraryItem.new(:leg_id => params[:leg_id])
            @attractions = Attraction.locations_in_place(@itinerary_item.leg)
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
            @leg = Leg.find_by(:id => params[:leg_id])
            @itinerary_item = ItineraryItem.find_by(:id => params[:id])
            @attractions = Attraction.locations_in_place(@itinerary_item.leg)
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

    def update
        if params[:itinerary_item][:leg_id]
            @itinerary_item = ItineraryItem.find_by(:id => params[:id])
            if @itinerary_item.update(itinerary_item_params)
                redirect_to leg_itinerary_item_path(@itinerary_item.leg, @itinerary_item)
            else
                redirect_to edit_leg_itinerary_item_path(@leg), alert: "Could Not Edit Item."
            end
        end
    end

    def destroy
        @item = ItineraryItem.find_by(:id => params[:id])
        @leg = @item.leg
        @item.destroy
        flash[:notice] = "Item deleted."
        redirect_to leg_path(@leg)
    end

    private
    def itinerary_item_params
        params.require(:itinerary_item).permit(:leg_id, :time, :day_of_trip, :type_of_activity, :attraction_id)
    end

end