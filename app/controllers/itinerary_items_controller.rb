class ItineraryItemsController < ApplicationController
    def index
        @leg = authorized_leg_and_vacation(params[:leg_id])
        if @leg.present?
            @itinerary_items = ItineraryItem.sort(params[:leg_id])
        else
            redirect_to vacations_path, alert: "You don't have permission to do that"
        end
    end

    def new
        @leg = authorized_leg_and_vacation(params[:leg_id])
        @itinerary_item = ItineraryItem.new(:leg_id => params[:leg_id])
        if @leg.present? && @itinerary_item.present?
            @attractions = Attraction.locations_in_place(@itinerary_item.leg)
        else
            redirect_to vacations_path, alert: "You don't have permission to do that."
        end
    end

    def show
        @leg = authorized_leg_and_vacation(params[:leg_id])
        if @leg.present?
            @itinerary_item = ItineraryItem.find_by(:id => params[:id])
        else
            redirect_to legs_path, alert: "Leg Not Found."
        end
    end

    def edit
        @leg = authorized_leg_and_vacation(params[:leg_id])
        @itinerary_item = ItineraryItem.find_by(:id => params[:id])
        if @leg.present? && @itinerary_item.present?
            @attractions = Attraction.locations_in_place(@itinerary_item.leg)
        else
            redirect_to vacations_path, alert: "You don't have permission to do that."
        end
    end

    def create
        @leg = authorized_leg_and_vacation(params[:itinerary_item][:leg_id])
        @itinerary_item = ItineraryItem.new(itinerary_item_params)
        if @leg.present? && @itinerary_item.present?
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

    def update
        @leg = authorized_leg_and_vacation(params[:itinerary_item][:leg_id])
        @itinerary_item = ItineraryItem.find_by(:id => params[:id])
        if @leg.present? && @itinerary_item.present?
            if @itinerary_item.update(itinerary_item_params)
                redirect_to leg_itinerary_item_path(@itinerary_item.leg, @itinerary_item)
            else
                redirect_to edit_leg_itinerary_item_path(@leg), alert: "Could Not Edit Item."
            end
        else
            redirect_to vacations_path, alert: "You don't have permission to do that."
        end
    end

    def destroy
        @item = ItineraryItem.find_by(:id => params[:id])
        if @item.present? && (Vacation.permit_view(current_user, @item.leg)).present?
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

    def authorized_leg_and_vacation(leg_id)
        if leg_id
            leg = Leg.find_by(:id => leg_id)
            if (Vacation.permit_view(current_user, leg)).present?
                return leg
            end
        end
    end
end