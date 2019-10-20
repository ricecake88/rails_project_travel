class LegsController < ApplicationController
    include ApplicationHelper

    def index
        if (params[:vacation_id])
           @legs = current_user.vacations.find_by(:id => params[:vacation_id]).legs
           binding.pry
           @legs = Vacation.find_by(:id => params[:vacation_id]).legs
        else
            flash[:notice] = "Cannot show this page"
            redirect_to '/'
        end
    end

    def new
        @leg = Leg.new(:id => params[:id])
        @places = Place.all
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
        if !(Vacation.permit_view(current_user, @leg)).present?
            flash[:notice] = "You don't have permission to do that."
            redirect_to '/'
        end
        @itinerary_items = ItineraryItem.sort(@leg.id)
        @arrival_place_name = Place.find_by(:id => @leg.arrival_place_id).city_name
        @departure_place_name = Place.find_by(:id => @leg.departure_place_id).city_name
    end

    def edit
        @leg = Leg.find_by(:id => params[:id])
        if !@leg.present? || Vacation.permit_view(current_user, @leg).empty?
            flash[:notice] = "You don't have permission to do that."
            redirect_to '/'
        else
            @places = Place.all
        end
    end

    def create
        @leg = Leg.new(leg_params)
        if @leg.save
            Vacation.update_vacation_places(@leg, "create")
            redirect_to leg_path(@leg)
        else
            binding.pry
            flash[:notice] = "Failed creating new leg."
            render :new
        end
    end

    def update
        @leg = Leg.find_by(:id => params[:id])
        if @leg.present? || Vacation.permit_view(current_user, @leg).present?
            Vacation.update_vacation_places(@leg, "delete")
            if @leg.update!(leg_params)
                Vacation.update_vacation_places(@leg, "create")
                redirect_to leg_path(@leg)
            end
        else
             render :edit
        end
    end

    def destroy
        @leg = Leg.find_by(:id => params[:id])
        if !@leg.present? || Vacation.permit_view(current_user, @leg).empty?
            flash[:notice] = "You don't have permission to do that."
            redirect_to '/'
        else
            @vacation = @leg.vacation
            Vacation.update_vacation_places(@leg, "delete")
            @leg.destroy
            flash[:notice] = "Leg Deleted."
            redirect_to vacation_path(@vacation)
        end
    end

    private
    def leg_params
        params.require(:leg).permit(:arrival_place_id, :departure_place_id, :leg_num, :vacation_id)
    end
end