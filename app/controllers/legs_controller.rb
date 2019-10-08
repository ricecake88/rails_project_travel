class LegsController < ApplicationController
    include ApplicationHelper

    def index
        #f (params[:vacation_id])
        #   @legs = current_user.vacations.find_by(:id => params[:vacation_id]).legs
        #   binding.pry
        #   @legs = Vacation.find_by(:id => params[:vacation_id]).legs
        #else
        #    flash[:notice] = "Cannot show this page"
        #    redirect_to legs_path
        #end
    end

    def new
        @leg = Leg.new(:id => params[:id])
        @places = Place.all
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
        if !@leg.present? || Vacation.permit_view(current_user, @leg).empty?
            flash[:notice] = "You don't have permission to do that."
            redirect_to '/'
        end

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
        if @leg.save!
            Leg.insert_and_update_places(@leg)
            redirect_to leg_path(@leg)
        else
            flash[:notice] = "Failed creating new leg."
            render new
        end
    end

    def update
        @leg = Leg.find_by(:id => params[:id])
        if @leg.update(leg_params)
                redirect_to leg_path(@leg)
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
            @leg.destroy
            flash[:notice] = "Leg Deleted."
            redirect_to vacation_path(@vacation)
        end
    end

    private
    def leg_params
        params.require(:leg).permit(:arrival_place_id, :departure_place_id, :vacation_id)
    end
end