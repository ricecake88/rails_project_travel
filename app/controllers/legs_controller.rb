class LegsController < ApplicationController
    before_action :authenticate_user!, raise: false, except: [:update]

    def index
       #if (params[:vacation_id])
       #   @legs = current_user.vacations.find_by(:id => params[:vacation_id]).legs
       #   @legs = Vacation.find_by(:id => params[:vacation_id]).legs
       #else
           redirect_to '/'
       #end
    end

    def new
        @leg = Leg.new(:id => params[:id])
        @destinations = Destination.all
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
        if !(Vacation.permit_view(current_user, @leg)).present?
            flash[:alert] = "You don't have permission to do that."
            redirect_to '/'
        else
            @itinerary_items = ItineraryItem.sort(@leg.id)
            @destination_city_name = Destination.find_by(:id => @leg.destination_id).city_name
            @departure_city_name = Destination.find_by(:id => @leg.departure_id).city_name
        end
    end

    def edit
        @leg = Leg.find_by(:id => params[:id])
        if !@leg.present? || Vacation.permit_view(current_user, @leg).empty?
            flash[:alert] = "You don't have permission to do that."
            redirect_to '/'
        else
            @destinations = Destination.all
        end
    end

    def create
        @leg = Leg.new(leg_params)
        if @leg.save
            flash[:notice] = "Added Leg to #{@leg.vacation.name}"
            redirect_to leg_path(@leg)
        else
            flash[:notice] = "Failed creating new leg."
            flash[:alert] = helpers.flash_error_message(@leg)
            @destinations = Destination.all
            redirect_to '/'
        end
    end

    def update
        @leg = Leg.find_by(:id => params[:id])
        if !@leg.present? || !Vacation.permit_view(current_user, @leg).present?
            flash[:alert] = "You don't have permission to do that."
            redirect_to '/'
        else
            if @leg.update(leg_params)
                flash[:notice] = "Updated leg information."
                redirect_to leg_path(@leg)
            else
                flash[:notice] = "Failed updating leg."
                flash[:alert] = helpers.flash_error_message(@leg)
                redirect_to '/'
            end
        end
    end

    def destroy
        @leg = Leg.find_by(:id => params[:id])
        if !@leg.present? || Vacation.permit_view(current_user, @leg).empty?
            flash[:notice] = "You don't have permission to do that."
            redirect_to '/'
        else
            @vacation = @leg.vacation
            @leg.destroy
            flash[:notice] = "Leg Deleted."
            redirect_to vacation_path(@vacation)
        end
    end

    private
    def leg_params
        params.require(:leg).permit(:departure_id, :destination_id, :leg_num, :vacation_id)
    end
end