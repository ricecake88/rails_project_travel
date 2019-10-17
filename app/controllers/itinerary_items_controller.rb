class ItineraryItemsController < ApplicationController
    def index
        if params[:leg_id]
            @leg = Leg.find_by(:id => params[:leg_id])
            if (Vacation.permit_view(current_user, @leg)).present?
                @itinerary_items = ItineraryItem.sort(params[:leg_id])
            else
                redirect_to vacations_path, alert: "You don't have permission to do that"
            end
        else
            flash[:notice] = "Not Used."
        end
    end

    def new
        if params[:leg_id]
            leg = Leg.find_by(:id => params[:leg_id])
            if (Vacation.permit_view(current_user, leg)).present?
                @itinerary_item = ItineraryItem.new(:leg_id => params[:leg_id])
                @attractions = Attraction.locations_in_place(@itinerary_item.leg)
            else
                redirect_to vacations_path, alert: "You don't have permission to do that."
            end
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
        if params[:leg_id]
            @leg = Leg.find_by(:id => params[:leg_id])
            if !Vacation.permit_view(current_user, @leg)).present?
                redirect_to vacations_path, alert: "You don't have permission to do that."
            else
                @itinerary_item = ItineraryItem.find_by(:id => params[:id])
                @attractions = Attraction.locations_in_place(@itinerary_item.leg)
            end
        end
    end

    def create
        if params[:itinerary_item][:leg_id]
            leg = Leg.find_by(:id => params[:itinerary_item][:leg_id])
            if (Vacation.permit_view(current_user,leg)).present?
                @itinerary_item = ItineraryItem.new(itinerary_item_params)
                if @itinerary_item.save
                    redirect_to leg_itinerary_item_path(@itinerary_item.leg, @itinerary_item)
                else
                    flash[:notice] = flash_error_message(@itinerary_item)
                    redirect_to new_leg_itinerary_item_path(@itinerary_item.leg)
                end
            else
                redirect_to vacations_path, alert: "You don't have permission to do that."
            end
        end
    end

    def update
        if params[:itinerary_item][:leg_id]
            @leg = Leg.find_by(:id => params[:itinerary_item][:leg_id])
            if (Vacation.permit_view(current_user, @leg.id)).present?
                @itinerary_item = ItineraryItem.find_by(:id => params[:id])
                if @itinerary_item.update(itinerary_item_params)
                    redirect_to leg_itinerary_item_path(@itinerary_item.leg, @itinerary_item)
                else
                    redirect_to edit_leg_itinerary_item_path(@leg), alert: "Could Not Edit Item."
                end
            else
                redirect_to vacations_path, alert: "You don't have permission to do that."
            end
        end
    end

    def destroy
        @item = ItineraryItem.find_by(:id => params[:id])
        if (Vacation.permit_view_by_leg_id(current_user, @item.leg.id)).present?
            @leg = @item.leg
            @item.destroy
            flash[:notice] = "Item deleted."
            redirect_to leg_path(@leg)
        else
            redirect_to vacations_path, alert: "You don't have permission to do that."
        end
    end

    private
    def itinerary_item_params
        params.require(:itinerary_item).permit(:leg_id, :time, :day_of_trip, :type_of_activity, :attraction_id)
    end

    def flash_error_message(arg)
        "The form contains #{ActionController::Base.helpers.pluralize(arg.errors.count, 'error')}: #{arg.errors.full_messages.join(', ')}".html_safe
    end

end